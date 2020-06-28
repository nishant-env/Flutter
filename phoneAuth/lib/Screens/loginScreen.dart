import 'package:flutter/material.dart';
import 'package:phoneAuth/snackBar.dart';
import 'package:phoneAuth/Services/firebaseAuth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSpinning = false;
  FirebaseAuthMethods _firebase = FirebaseAuthMethods();
  var _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      return value.length != 10
                          ? "Please enter a valid number"
                          : null;
                    },
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
//                style: Theme.of(context).textTheme.headline4,
                    decoration: InputDecoration(
                        prefixText: '+977',
                        icon: Icon(Icons.phone),
                        labelText: 'Enter Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                FlatButton(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isSpinning = true;
                          _phoneNumberController.clear();
                        });
                        _firebase.authenticateUsingPhone(
                            _phoneNumberController.text, context, () {
                          setState(() {
                            isSpinning = false;
                          });
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
