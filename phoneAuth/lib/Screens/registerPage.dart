import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phoneAuth/Screens/homeScreen.dart';
import '../Services/cloudFirestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

Map<String,dynamic> usermap= {};
class RegisterPage extends StatefulWidget {
  
  final FirebaseUser user;
  RegisterPage(this.user);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final CloudMethods cloudFireStore = CloudMethods();

  final TextEditingController _nameController = TextEditingController();
  bool isSpinning = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Please Input Your Details'),
      centerTitle: true,
      ),
      body: ModalProgressHUD(
              inAsyncCall: isSpinning,
              child: Container(
          child: Column(
            children:[
              formField(
                'Enter Full Name',
                _nameController
              ),
              SizedBox(height: 5,),
              FlatButton(
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    isSpinning = true;
                  });
                createUserData();
                cloudFireStore.addUserData(usermap, widget.user.phoneNumber).then((value) {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen(),)
                );
                });
                
              },
               child: Text('Submit'))
            ]
          ),
        ),
      ),
    );
  }

createUserData(){
  usermap.putIfAbsent('fullName', () => '${_nameController.text}');
  usermap.putIfAbsent('phoneNumber', () => '${widget.user.phoneNumber}');
  usermap.putIfAbsent('uid', () => '${widget.user.uid}');

  return usermap;
}

Widget formField(String hinttext,TextEditingController control){
  return TextFormField(
    controller: control,
    decoration: InputDecoration(
      hintText: hinttext,
    ),
  );
}
}