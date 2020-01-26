import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget
{
  final Bloc bloc;
  Provider({Key key, Widget child})
      : bloc = Bloc(),
        super(key: key, child: child);
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
  }



}