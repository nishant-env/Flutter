import 'package:flutter/material.dart';
import 'package:phoneAuth/Screens/homeScreen.dart';
import 'package:phoneAuth/Screens/loginScreen.dart';
import '../Services/firebaseAuth.dart';


class RootChecker extends StatefulWidget {
  @override
  _RootCheckerState createState() => _RootCheckerState();
}

class _RootCheckerState extends State<RootChecker> {
FirebaseAuthMethods _authMethods = FirebaseAuthMethods();
bool checkingifLogged = false;
  initState(){
    super.initState();
    isLoggedInChecker();
  }


  isLoggedInChecker() async {
    var tempLoginChecker = await _authMethods.checkingIfLogged();
    print(tempLoginChecker);
    setState(() {
      checkingifLogged = tempLoginChecker;
    });
  }

  Widget build(BuildContext context) {
    return checkingifLogged ? HomeScreen() : LoginScreen();
  }
}