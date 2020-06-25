import 'package:flutter/material.dart';
GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
displaySnackBar(String text){
 final snackbar = SnackBar(
    content: Text(text),
    duration: Duration(seconds: 1),
  );
  scaffoldKey.currentState.showSnackBar(snackbar);
}