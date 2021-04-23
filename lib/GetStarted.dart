import 'package:flutter/material.dart';
import 'package:flutter_assignment/Login.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment(0, -0.7),
            child: Container(
              width: 200,
              height: 100,
              child: Column(
                children: [
                  Align(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/icon.png'),
                          ),
                        ),
                        Container(
                          child: Text('Turbo', style: TextStyle(fontSize: 30, color: Colors.blue[400]),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text('Movie', style: TextStyle(fontSize: 50, color: Colors.blue[400]),),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,0),
            child: Container(
              child: Text('WELCOME', style: TextStyle(fontSize: 26),),
            ),
          ),
          Align(
            alignment: Alignment(0,0.5),
            child: GestureDetector(
              onTap: loginPage,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.blue
                  )
                ),
                width: size.width/2.5,
                height: 50,
                child: Center(child: new Text("GETTING START", style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],
      ),
    );
  }

  loginPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}