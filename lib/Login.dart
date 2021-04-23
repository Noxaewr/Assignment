import 'package:flutter/material.dart';
import 'package:flutter_assignment/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // for the login API yts.mx said 
  // To make any POST requests to our API you must use your developer's 'application_key', if you do not have one please apply HERE 

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
            alignment: Alignment(0,-0.2),
            child: Container(
              width: size.width/1.2,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400],),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400],),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  hintText: 'Username'
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment(0,0),
            child: Container(
              width: size.width/1.2,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400],),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400],),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  hintText: 'Password'
                ),
              ),
            )
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
                child: Center(child: new Text("Login", style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],
      ),
    );
  }

  loginPage(){
    print('asd');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}