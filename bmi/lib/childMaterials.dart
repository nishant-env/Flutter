import 'package:flutter/material.dart';


class ContainerChild extends StatelessWidget {
  final IconData icon;
  final String text;
  ContainerChild({this.icon,this.text});
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
      Icon(icon,
      size: 80.0,
      ),
      SizedBox(height: 10,),
      Text(text,
      style: TextStyle(
        fontSize: 20.0
      ),
      ),
    ]
    );
  }
}