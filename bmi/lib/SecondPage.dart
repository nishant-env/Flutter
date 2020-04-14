import 'package:flutter/material.dart';
import "desContainer.dart";
import 'screenArguments.dart';
const secondPageContainerColor = 0xFF26294D;

class OutputPage extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Your BMI"),
        centerTitle: true,
      ),
        body: ScaffoldBody(),
      );
  }
}
String text1;
String text2;

class ScaffoldBody extends StatelessWidget {
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    double bmi = args.bmi;
    if (args.bmi>25){
      text1 = "OverWeight";
      text2 = "Your BMI is more than Normal. Focus more on exercises and eat less";
    }
    else if(args.bmi>=18.5)
    {
      text1 = "Normal";
      text2 = "You have a normal BMI. Well Done!!!";
    }
    else {
      text1 = "UnderWeight";
      text2 = "Your BMI is less than normal. Consider eating a little more";
    }
    return desContainer(color: 0xFF26294D,
    cardChild: Column(
      children: <Widget>[
        Expanded(flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(text1,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0
              ),),
              SizedBox(height:100.0),
              Text("$bmi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 100.0,
              ),),
              Text(text2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                
              ),),
            ],
          ),
          ),
          Expanded(child: 
           FlatButton(
      child: Container(
          color: Color(0xFFFF0067),
          height: 80.0,
          width: double.infinity,
          margin: EdgeInsets.only(top:10),
          child: Center(
                      child: Text("Re-Calculate",
            style: TextStyle(
              fontSize: 30.0,
            ),
            ),
          ),
        ),
        onPressed: (){
          Navigator.pop(context);

        },
  ),
          ),
      ],
    ),
    );
  }
}