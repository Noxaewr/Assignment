import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tempMovieData = [];
  bool downloading;

  Future<void> getData() async{
    http.Response response = await http.get(
      Uri.encodeFull("https://yts.mx/api/v2/list_movies.json?limit=10&sort_by=year"),
      //https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept" : "application/json"
      }
    );
    
    Map<String, dynamic> data = jsonDecode(response.body);
    var _list = data.values.toList();

      setState(() {
        downloading=false;
        tempMovieData=_list[2]['movies'];
      }); 
  }

  @override
  void initState() {
    super.initState();
    downloading = true;
    new Timer(new Duration(milliseconds: 300), () {
      getData();
      print('1235');
    });
  }

  Widget getAllMovie() {
    List<Widget> list = <Widget>[];
    if(tempMovieData.length==0){
      list.add(
        Padding(
          padding: EdgeInsets.only(top :MediaQuery.of(context).size.height/3),
          child: Center(
            child: Text('No data', style: TextStyle(color: Colors.black),),
          ),
        )
      );
    }else{
      for(var i=0; i<tempMovieData.length; i++){
        list.add(
            getAllMovieDetail(tempMovieData[i]['title'], tempMovieData[i]['small_cover_image'].toString(), tempMovieData[i]['rating'].toString()
            , tempMovieData[i]['genres'][0]
          )
        );
      }
    }

    return new ListView(
      scrollDirection: Axis.vertical,
      children: list);
  }

  Widget getAllMovieDetail(String title, String image, String rating, String genre) {
    return new Padding(
      padding: const EdgeInsets.only(left:15,right:15, top:5.0, bottom: 5.0),
      child: Material(
        child: GestureDetector(
          onTap: () {
          },
          child: Container(
            decoration: new BoxDecoration(
              border: Border.all(color: Colors.black26)
            ),
            child: Row(
              children: [
                Container(
                  child: Image.network(image),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        child: Text(title),
                      ),
                      Container(
                        width: 200,
                        child: Text('Rating : ' + rating)
                      ),
                      Container(
                        width: 200,
                        child: Text(genre)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: new Text(
              "Movie Turbo",
              style: new TextStyle(color: Colors.blue[400]),
            ),
          ),
          backgroundColor: new Color(0xFFFFFFFF),
          iconTheme: new IconThemeData(color: Colors.black),
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          downloading==false?
          Container(
            height: MediaQuery.of(context).size.height-90,
            child: getAllMovie(),
          )
          :
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
            child:Center(
              child: Container(
                height: 150.0,
                child: Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black.withOpacity(0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Retrieving Data',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}