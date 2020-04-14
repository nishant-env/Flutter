import 'package:flutter/material.dart';


class loadingContainer extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return ListTile(
      title: createContainer(),
      subtitle: createContainer(),
    );
  }}
Widget createContainer()
{
  return Container(
    color: Colors.grey[200],
    height: 24.0,
    width: 150.0,
    margin: EdgeInsets.only(top:5.0,bottom: 5.0),
  );
}
  
