import 'package:flutter/material.dart';
import 'provider.dart';


class LoginScreen extends StatelessWidget
{
  Widget build(context)
  {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField(bloc),
          passField(bloc),
          Padding(padding: EdgeInsets.only(bottom: 20.0) ,),
          submitButton(bloc),
        ],



      ),
    );
  }
  Widget emailField(bloc)
  {
    return StreamBuilder(
      stream: bloc.getEmail,
      builder: (context,snapshot)
      {
return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email address',
        labelText: 'Email Address',
        errorText: snapshot.error
      ),
      onChanged: (data)
      {
        bloc.changeEmail(data);
      },

    );
    }
    );
      
  }




    
  Widget passField(bloc)
  {
    return StreamBuilder(
      stream: bloc.getPassword,
      builder: (context,snapshot){
return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Please enter your password here',
        labelText: 'Password Field',
        errorText: snapshot.error
      ),
      onChanged: bloc.changePassword,
    );


      },
    );
    
  }
Widget submitButton(bloc)
{
  return StreamBuilder(
    stream: bloc.checkButton,
    builder: (context,snapshot){
      return RaisedButton(
    color: Colors.blue,
    child: Text('Login'),
    onPressed: (snapshot.hasData)? bloc.submit
        : null,
    
    
    
  );});
     
  



}}