import 'dart:async';
import 'package:flutter/material.dart';
import '../models.dart';
import 'loading_Container.dart';


class commentWid extends StatelessWidget
{
  final int itemId;
  final Map<int,Future<ItemModel>> itemMap;
  final int depth;
  commentWid({this.itemId,this.itemMap,this.depth});
  Widget build(BuildContext context)
  {
    

    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context,AsyncSnapshot<ItemModel> snapshot){
        if(!snapshot.hasData)
        return loadingContainer();
        final commentList = <Widget>[
      ListTile(
        title: buildText(snapshot.data),
        subtitle: snapshot.data.by ==''?Text('Deleted') :Text(snapshot.data.by),
        contentPadding: EdgeInsets.only(
          right: 16.0,
          left: (depth+1)*16.0,
        ),
        ),
      Divider(),];
      snapshot.data.kids.forEach((kidId){
        commentList.add(commentWid(
          itemId: kidId,
          itemMap: itemMap,
          depth: depth+1, 
        ));
      })
      ;
        return Column(children: commentList,);
      },
    );
    
  }
  buildText(ItemModel item)
  {
    String text = item.text.replaceAll('&#x2F;',"'")
    .replaceAll('<p>', '\n\n')
    .replaceAll('</p>', '')
    .replaceAll('&#x27;', "'")
    .replaceAll('<i>', '')
    .replaceAll('</i>', '');
    return Text(text);
  }
}