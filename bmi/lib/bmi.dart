import 'package:bmi/SecondPage.dart';
import 'package:flutter/material.dart';
import 'desContainer.dart';
import 'childMaterials.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'second_container.dart';
import 'third_Container.dart';
import 'screenArguments.dart';

String MFSelector ='m';
const bottomContainerHeight = 80.0;
const maleColor = 0xFF141A3C;
const femaleColor = 0xFF26294D;
var color=maleColor;
const bottomContainerColor = 0xFFFF0067;
int weight = 1;
int age =1;

class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
 
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("BMI Calculator"),
      centerTitle: true,
    ),
  body: Column(children: <Widget>[
    Expanded(child: Row(children: <Widget>[
     Expanded(child: desContainer(color: maleColor,
     cardChild: FlatButton(
        onPressed: (){
          setState(() {
            color = maleColor;
            MFSelector = 'm';
          });
        },
            child: ContainerChild(
         icon: FontAwesomeIcons.mars,
         text: "Male",
       ),
     ),
     ),
     ),
      Expanded(child: desContainer(color: femaleColor,
       cardChild: FlatButton(
         onPressed: (){
           setState(() {
             color = femaleColor;
             MFSelector = 'f';
           });
         },
                child: ContainerChild(
         icon: FontAwesomeIcons.venus,
         text: "Female",
     ),
       ),
      ),
      ),
      ],
      ),
      ),
      Expanded(child: desContainer(color: color,
      cardChild: SecondContainer(),
      )),
     Expanded(child: Row(
       children: <Widget>[
         Expanded(
                    child: desContainer(color: color,
           cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Text("Weight",style: style2),
             Text(weight.toString(),style: style1,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children:<Widget>[
               Button(icon: FontAwesomeIcons.minus, onPressed: (){setState((){weight--;});
               }),
               SizedBox(width:15),
               Button(icon: FontAwesomeIcons.plus, onPressed: (){setState((){weight++;});
               }),])
           ],)
           ),
         ),
         Expanded(
                    child: desContainer(color: color,
           cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Text("Age",style: style2),
             Text(age.toString(),style: style1,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children:<Widget>[
               Button(icon: FontAwesomeIcons.minus, onPressed: (){setState((){age--;});
               }),
               SizedBox(width:15),
               Button(icon: FontAwesomeIcons.plus, onPressed: (){setState((){age++;});
               }),])
           ],)
           ),
         ),
       ],
     ),
     ),
    
  FlatButton(
      child: Container(
          color: Color(bottomContainerColor),
          height: bottomContainerHeight,
          width: double.infinity,
          margin: EdgeInsets.only(top:10),
          child: Center(
                      child: Text("Calculate Your BMI",
            style: TextStyle(
              fontSize: 30.0,
            ),
            ),
          ),
        ),
        onPressed: (){
          double bmi = BMICalc();
          Navigator.pushNamed(context, "/a",arguments: ScreenArguments(MFSelector,bmi));
        },
  ),
  ],

  )
    );
  }
  double BMICalc()
  {
    double bmi;
    double meter = (heightCounter/100);
    bmi = weight / (meter*meter) ;
    return bmi;
  }
}
