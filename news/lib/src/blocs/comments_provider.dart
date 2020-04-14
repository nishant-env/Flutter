import 'package:flutter/material.dart';
import 'comments_bloc.dart';
export 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget
{
  final Comments bloc;
CommentsProvider({Key key, Widget child})
  : bloc = Comments(),
  super(key:key , child:child);

  bool updateShouldNotify(_){
    return true;
  }

  static Comments of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType<CommentsProvider>().bloc;
  }

} 