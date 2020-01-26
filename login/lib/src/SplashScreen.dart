import 'package:flutter/material.dart';
import 'dart:async';
import 'app.dart';
class Splash extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<Splash>
{
  @override
void initState()
{
  super.initState();
  Future.delayed(
  Duration(seconds: 3),(){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => App(), 
    ));
  }
  );
}
  
  Widget build(context)
  {
    return Scaffold(
        body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Colors.blueAccent,
                    child: Text('inSahya',style: TextStyle(fontSize:15.0 )),                  ),
                    Text('BY SWIMMERS'),
                ],
              )
            ),
            Expanded(
              flex: 1,
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Let the innovate begin')

                ],
              ),
            )
          ],
        )
        
        
        
        ]
      ),
      );

  }
}