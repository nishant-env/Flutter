import 'dart:async';

class Mixin
{
  final validateEmail = new StreamTransformer<String, String>.fromHandlers(
    handleData: (email,sink){
      if (email.contains('@'))
  sink.add(email);
  else 
  sink.addError('Enter a valid email address');
    }
  );
final validatePassword = new StreamTransformer<String, String>.fromHandlers(
  handleData:(pass,sink){
    if(pass.length >=4)
    sink.add(pass);
    else 
    sink.addError('Password length must be at least 4');
  }
);



} 
