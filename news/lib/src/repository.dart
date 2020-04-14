import 'offlineStorage.dart';
import 'models.dart';
import 'resourse.dart';
import 'dart:async';


class Repository
{
  List<Source> sources =<Source>[
    offline,
    NewsApi(),
  ];
  List<Cache> caches =<Cache>[
    offline,
  ];

 Future<List<int>> fetchTopIds()
  {
    return sources[1].topIds();
    
  }
  Future<ItemModel> fetchItems (int ids) async
  {
    ItemModel items;
    var source;
    for (source in sources)
    {
      items = await source.fetchItem(ids);
      if (items != null){
      break;}
    }
    for (var cache in caches){
      if (cache !=source){
     cache.addItem(items);
      }
     }
    return items;
   
  }
clearCache() async
{
  for (var cache in caches)
  await cache.clear();
}
}
abstract class Source{
  Future<List<int>> topIds();
  Future<ItemModel> fetchItem(int id);
}
abstract class Cache{
  Future<int> addItem(ItemModel item);
  Future<int> clear();

}