import 'package:flutter/material.dart';
const int sliderColor = 0xFFFF0067;
int heightCounter=50;
TextStyle style1 = TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold);
TextStyle style2 = TextStyle( fontSize: 20.0,);
class SecondContainer extends StatefulWidget {
  
  _SecondContainerState createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
 
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
      children:<Widget>[
     Text("HEIGHT",
     style: style2,
     ),
    Row(mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[Text("$heightCounter",style: style1,),Text("cm",style: style2)]),
    SliderTheme(
      data: SliderThemeData().copyWith(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        activeTrackColor: Colors.white,
      ),
          child: Slider(value: heightCounter.toDouble(), onChanged: (newValue){setState(() {
        heightCounter = newValue.round();
      }
      );},
      min: 50,
      max: 200,
      inactiveColor: Colors.white,
      activeColor: Color(sliderColor),
      ),
    )

    ],
    );
  }
}