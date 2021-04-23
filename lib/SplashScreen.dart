import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_assignment/GetStarted.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState() {
      new Timer(new Duration(seconds: 5), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GetStarted()),
        );
      });
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
          alignment: Alignment(0, 0),
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
          )
        ],
      ),
    );
  }
}