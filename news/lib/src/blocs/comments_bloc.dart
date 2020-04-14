import 'dart:async';
import '../models.dart';
import 'package:rxdart/rxdart.dart';
import '../repository.dart';

class Comments{
  

  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int,Future<ItemModel>>>();
  final _repo = Repository();
  //Streams Getters
 Observable<Map<int,Future<ItemModel>>> get itemsWithComments => _commentsOutput.stream;

  //Sink Getters
Function(int) get fetchItemsWithComments => _commentsFetcher.sink.add;

Comments()
{
  _commentsFetcher.stream.transform(_commentsTransformer()).pipe(_commentsOutput);
}

_commentsTransformer()
{
  return ScanStreamTransformer<int,Map<int,Future<ItemModel>>>(
    (cache, int id, index){
      
      cache[id] = _repo.fetchItems(id);
      cache[id].then((ItemModel item)
      {
        item.kids.forEach((kidId) => fetchItemsWithComments(kidId));
      });
  return cache;
    },
    
    <int,Future<ItemModel>>{}
  );
}

dispose(){
  _commentsFetcher.close();
  _commentsOutput.close();
}
}