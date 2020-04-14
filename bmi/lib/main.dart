import 'package:flutter/material.dart';
import 'bmi.dart';
import 'SecondPage.dart';
main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
         primaryColor: Color(0xFF101639),
        scaffoldBackgroundColor: Color(0xFF0C1234),
      ),
     routes: {
       "/": (context)=> bmi(),
       "/a":(context)=> OutputPage(),
     },
     initialRoute: "/",
      );
  }
}
