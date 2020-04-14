import 'package:flutter/material.dart';
import '../blocs/titles_provider.dart';
import 'news_list.dart';
import 'news_details.dart';
import '../blocs/comments_provider.dart';
import 'splash.dart';

class App extends StatelessWidget{
  
  Widget build(BuildContext context){
    return CommentsProvider(
      child: Provider(
      child: MaterialApp(
      onGenerateRoute: routes,
       )
    ));
    }
    Route routes(RouteSettings settings)
    {
      if (settings.name == '/')
      {
        return MaterialPageRoute(
          builder: (context)
          {
            
            return Splash();
          }
        ); 
      }
      if (settings.name == '/a')
      {
        return MaterialPageRoute(
          builder: (context)
          {
            final bloc = Provider.of(context);
             bloc.fetchTopIds();
            return NewsProvider();
          }
        );
      }
      else{
        return MaterialPageRoute(
          builder: (context)
          {
            final commentsBloc = CommentsProvider.of(context);
            final itemId = int.parse(settings.name.replaceFirst('/', ''));
            commentsBloc.fetchItemsWithComments(itemId);
            return Details(
              itemId : itemId
            );
          }
        );
      }
    }
    
    
    }