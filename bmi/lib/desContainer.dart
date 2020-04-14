import 'package:flutter/material.dart';
class desContainer extends StatelessWidget {
  final int color;
  final Widget cardChild;
  desContainer({@required this.color,this.cardChild});

  Widget build(BuildContext context) {
    return Container(
  margin: EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Color(color),
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: cardChild,
    );
  }
}