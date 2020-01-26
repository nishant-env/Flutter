import 'package:flutter/material.dart';
import 'mixins.dart';

class LoginStyle extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginStyleState();
  }
}
class LoginStyleState extends State<LoginStyle> with ValidateMixin
{
  final keyGlob = GlobalKey<FormState>();
  Widget build(context)
  {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: keyGlob,
        child: Column(
          children: <Widget>[
            emailField()
            ,passField(),
            Padding(padding: EdgeInsets.only(top: 5.1),),
            button(),


          ],
        ),
      )          
          );
  }
  Widget emailField()
  {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@example.com',
        
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String data){
       return emailValidate(data);
      },
      onSaved: (String data)
      {
        print(data);
      },
    );
  }
  Widget passField()
  {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
      ),
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: true,
      validator: (String data){
       return passValidate(data);
      },
      onSaved: (String data)
      {
        print(data);
      },
    );
  }
  Widget button()
  {
    return RaisedButton(
      child: Text('Login'),
      elevation: 20.3,
      splashColor: Colors.blue[300],
      color: Colors.blue,

      onPressed: (){
       if(keyGlob.currentState.validate())
       keyGlob.currentState.save();
      },
    );
  }
}