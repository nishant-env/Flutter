import 'package:flutter/material.dart';
import '../blocs/comments_provider.dart';
import '../models.dart';
import 'dart:async';
import 'comments_widget.dart';

class Details extends StatelessWidget
{
  final int itemId;
  Details({this.itemId});
  Widget build(BuildContext context)
  {
    final bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
        centerTitle: true,
      ),
      body: buildBody(bloc),
    );
  }
  Widget buildBody(bloc)
  {
    return StreamBuilder(
      stream: bloc.itemsWithComments,
      builder: (context ,AsyncSnapshot<Map<int,Future<ItemModel>>> snapshot){
        if (!snapshot.hasData){
          return Text("Still Loading");
        }
        final futureItem = snapshot.data[itemId];
        return FutureBuilder(
          future: futureItem,
          builder: (context,AsyncSnapshot<ItemModel> itemSnapshot){
            if(!itemSnapshot.hasData){
            return Text("Still no data");}

            return buildList(itemSnapshot.data,snapshot.data);

          },
        );
      },
    );
  }
  Widget buildList(ItemModel item, Map<int,Future<ItemModel>> itemMap)
  {
    final children = <Widget>[];
    children.add(buildTitle(item));
    final comment = item.kids.map((kidId){
      return commentWid(
        itemId: kidId,
        itemMap: itemMap,
        depth: 0,
      );
    }).toList();
    children.addAll(comment);
    return ListView(
      children: children,
    );
  }
  Widget buildTitle(ItemModel item)
  {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(5.0),
      child: Text(item.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      ),
      
      );
  }
}