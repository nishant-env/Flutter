import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phoneAuth/Screens/registerPage.dart';
import 'package:phoneAuth/Services/cloudFirestore.dart';
import 'package:phoneAuth/snackBar.dart';
import '../Screens/homeScreen.dart';


class FirebaseAuthMethods{
  QuerySnapshot dataUser;
  TextEditingController _codeController = TextEditingController();
 static String verificationId;
  String codeSent;
  FirebaseAuth _auth = FirebaseAuth.instance;
  CloudMethods _firebaseCloud = CloudMethods(); 


final Duration _timeOut = Duration(minutes: 1);


final PhoneVerificationFailed verifyFailed = (AuthException exception){
  displaySnackBar('${exception.message}');
};



final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String varId){
  verificationId = varId;
};




  Future authenticateUsingPhone(String phoneNumber, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+977'+phoneNumber,
     timeout: _timeOut,
      verificationCompleted: (AuthCredential auth){
  _auth.signInWithCredential(auth).then((value) {
             _firebaseCloud.getUsersData(phoneNumber).then((value1)
               {
               if(value1.documents.isNotEmpty){ 
                 Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> HomeScreen()),
            );}
            else{
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> RegisterPage(value.user)),
            );
            }
               });
            }
            );
},
       verificationFailed: verifyFailed,
        codeSent: (String varId, [int forceCodeResend]){
        verificationId = varId;
  showDialog(context: context,
  builder: (context){
    return AlertDialog(
      title: Text('Enter Code'),
      content: TextFormField(
        controller: _codeController,
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
            AuthCredential cred = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: _codeController.text.trim());
            _auth.signInWithCredential(cred).then((value){ 
              _firebaseCloud.getUsersData(phoneNumber).then((value1)
               {
                 print(value1.documents);
               if(value1.documents.isNotEmpty){ 
                 Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> HomeScreen()),
            );}
            else{
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> RegisterPage(value.user)),
            );
            }
               });
            
            }
            );
            
        },
         child: Text('Submit')),
      ],
    );
  }
  );
    },
         codeAutoRetrievalTimeout: autoRetrieve);
  }

 signOut(){
  _auth.signOut();
}

}

