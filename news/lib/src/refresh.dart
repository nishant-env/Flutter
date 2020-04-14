import 'package:flutter/material.dart';
import 'blocs/titles_provider.dart';

class Refresh extends StatelessWidget
{
  final Widget child;
  Refresh(this.child);
  Widget build(context)
  {
    final bloc = Provider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async{
       await bloc.clearCache();
       await bloc.fetchTopIds();
      },
    );
  }
}