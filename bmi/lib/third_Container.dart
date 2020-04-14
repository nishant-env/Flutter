import 'package:flutter/material.dart';

class Button extends StatelessWidget {
 final IconData icon;
final Function onPressed;
Button({@required this.icon,@required this.onPressed});
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0,
      ),
    );
  }
}

