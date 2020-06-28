import 'package:shared_preferences/shared_preferences.dart';


addPhoneNumber(String phoneNumber) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('phoneNumber', phoneNumber);
}