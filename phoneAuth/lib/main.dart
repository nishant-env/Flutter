import 'package:flutter/material.dart';
import 'package:phoneAuth/Screens/loginScreen.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
