import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'provider.dart';
class App extends StatelessWidget
{
  Widget build(context)
  {
    
    return Provider(
      child: MaterialApp(
      title: 'Log me in',
      home: Scaffold(
        appBar: AppBar(
          title: Text('inSahya')
        ),
        body: LoginScreen(),
      )
    ),
    );
    
  }
}