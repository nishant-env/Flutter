import 'package:news/src/models.dart';
import 'package:rxdart/rxdart.dart';
import '../repository.dart';

class TitleBloc{
  final _topIds = PublishSubject<List<int>>();
  final _repo = Repository();
  final _itemsOutput = BehaviorSubject<Map<int,Future<ItemModel>>>();
  final _itemsFetch = PublishSubject<int>();
  
//Stream getters
  Observable<List<int>> get topIds => _topIds.stream ;
  Observable<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;

//Sink getters
Function(int) get fetchItems => _itemsFetch.sink.add;

TitleBloc(){
  _itemsFetch.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
}


  fetchTopIds() async {
    final id1 = await _repo.fetchTopIds();
    _topIds.sink.add(id1);
  }
clearCache()
{
  return _repo.clearCache();
}
  _itemsTransformer(){
    return ScanStreamTransformer(
     (Map<int, Future<ItemModel>> caches, int id,_)
     {
    caches[id] = _repo.fetchItems(id);
    return caches;
     },
     <int, Future<ItemModel>> {},
    );
  }

  

  dispose()
  {
    _topIds.close();
    _itemsOutput.close();
    _itemsFetch.close();
  }
}
