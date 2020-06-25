import 'package:flutter/material.dart';
import 'package:phoneAuth/snackBar.dart';
import 'package:phoneAuth/Services/firebaseAuth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuthMethods _firebase = FirebaseAuthMethods();
  
  TextEditingController _phoneNumberController = TextEditingController();
  bool isSpinning = false;
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
            'Login'
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
          inAsyncCall: isSpinning,
              child: Center(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
//                style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                    prefixText: '+977',
                    icon: Icon(Icons.phone),
                    labelText: 'Enter Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
                SizedBox(height:10),
                FlatButton(
                  child: Text('Login',style: TextStyle(fontSize: 30),),
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                  color: Colors.blue,
                  onPressed: (){
                    setState(() {
                      isSpinning = true;
                    });
                    _firebase.authenticateUsingPhone(_phoneNumberController.text, context);
                  }
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
