import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phoneAuth/Screens/loginScreen.dart';
import '../Services/firebaseAuth.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuthMethods _firebase = FirebaseAuthMethods();
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  initState(){
    super.initState();
    getCurrentUser();
  }
getCurrentUser()  {
  
   _auth.currentUser().then((value) {
     setState(() {
       user = value;
     });
   }); 
  
   
}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){ 
          _firebase.signOut();
          
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> LoginScreen())
            );
          })
        ],
        title: Text("You've Successfully Logged In"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: 
          user!= null ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            <Widget>[
            Text('Phone Number: ${user.phoneNumber}')
          ],): Container(),
            )
      ),
    );
  }
}