import 'package:cloud_firestore/cloud_firestore.dart';
import '../snackBar.dart';

class CloudMethods{
  Firestore firestore = Firestore.instance;

  Future<QuerySnapshot> getUsersData(String phone)async{
    return await firestore.collection('Users').where('phoneNumber', isEqualTo:'+977$phone').getDocuments().catchError((e){
      displaySnackBar(e.toString());
    });
  }
Future addUserData(Map<String,dynamic> userData,String phoneNumber)async{
  return await firestore.collection('Users').document(phoneNumber).setData(userData);
}

}