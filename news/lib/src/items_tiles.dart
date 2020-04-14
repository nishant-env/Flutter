import 'package:flutter/material.dart';
import 'models.dart';
import 'blocs/titles_provider.dart';
import 'ui/loading_Container.dart';

class NewsListTile extends StatelessWidget
{
  final int newsId;
  NewsListTile({this.newsId});
  Widget build(context){
    final bloc = Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (context,AsyncSnapshot<Map<int,Future<ItemModel>>> snapshot){
        if (!snapshot.hasData){
        return loadingContainer();}
      return FutureBuilder(
        future: snapshot.data[newsId],
        builder: (context, itemsnapshot){
          if(!itemsnapshot.hasData){
          return loadingContainer();}
          return newsTile(context,itemsnapshot.data);
        },
        );
      },
    );
  }
  Widget newsTile(BuildContext context,ItemModel item)
  {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: (){
            Navigator.pushNamed(context, '/${item.id}');
          },
      title: Text(item.title),
      subtitle: Text('${item.score} Votes'),
      trailing: Column(children: <Widget>[
        Icon(Icons.comment),
        Text('${item.descendants}')
      ],),


    ),
    Divider(
      height: 8.0,
    )
      ],
    );
  }
  
}