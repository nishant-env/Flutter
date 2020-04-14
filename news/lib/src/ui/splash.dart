import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {

  super.initState();
  Future.delayed(
  Duration(seconds: 3),(){
    Navigator.pushReplacementNamed(context, '/a');
  });
  }
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body:Stack(
      fit: StackFit.expand,
      children: <Widget>[
       Container(
         color: Colors.blue,
       ),
       Column(mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       children: <Widget>[
         Expanded(
           flex: 3,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueGrey,
                child: Image.asset('assets/images/News.png'),),
              Padding(padding: EdgeInsets.only(top: 15.0),),
              Text('We delever hot Hacker News',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Bangers'

              ) ,),
             ],
           ),
         ),
         Expanded(
           flex: 2,
           child: Column(
             children: <Widget>[
               CircularProgressIndicator(
                 backgroundColor: Colors.white,
               ),
               Padding(padding: EdgeInsets.only(top: 10),),
               Text('Please Wait'),

             ],
           ),
         ),
      Expanded(
        flex: 1,
        child: Shimmer.fromColors(
          baseColor: Colors.indigo[600],
          highlightColor: Colors.purple[400],
          child: Text('Swimmers',style: TextStyle(
            fontFamily: 'Chinese',
            fontStyle: FontStyle.italic,
            fontSize: 30,

          ),),
        ),
      )


       ],
       )

      ],
    )));
  }
}