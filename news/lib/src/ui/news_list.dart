import 'package:flutter/material.dart';
import '../blocs/titles_provider.dart';
import '../items_tiles.dart';
import '../refresh.dart';



class NewsProvider extends StatefulWidget
{
  NewsProviderState createState(){
     return NewsProviderState();
  }
}

class NewsProviderState extends State<NewsProvider>{
  
  Widget build(context)
  {
    final bloc = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
          centerTitle: true,
        ), 
        body: titlesPage(bloc),
      );
  }
  Widget titlesPage(bloc){
    
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (BuildContext context ,AsyncSnapshot<List<int>> snapshot){
        if (!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Refresh(ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index){
            bloc.fetchItems(snapshot.data[index]);
            return NewsListTile(newsId: snapshot.data[index],);
          },
        ));
      },
    );
  }
}


    
  