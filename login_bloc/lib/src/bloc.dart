import 'dart:async';
import 'validate.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Mixin
{
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

 Function(String) get changeEmail => _email.sink.add;
 Function(String) get changePassword => _password.sink.add;
 Stream<bool> get checkButton => Observable.combineLatest2(getEmail,getPassword,(e,p)=> true);
 Stream<String> get getEmail => _email.stream.transform(validateEmail);
 Stream<String> get getPassword => _password.stream.transform(validatePassword);
 
 submit()
 {
   final email = _email.value;
   final password = _password.value;
   print('Email is $email');
   print('Password is $password');
 }

dispose()
{
  _email.close();
  _password.close();
}
}

