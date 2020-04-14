import 'package:flutter/material.dart';
import 'titles_bloc.dart';
export 'titles_bloc.dart';

class Provider extends InheritedWidget{
  final TitleBloc bloc;
  Provider({Key key, Widget child})
      : bloc = TitleBloc(),
        super(key: key, child: child);
  bool updateShouldNotify(_) => true ;
  static TitleBloc of(BuildContext context)
  {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().bloc);
  }
}