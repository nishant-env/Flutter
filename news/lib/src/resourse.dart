import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'models.dart';
import 'repository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApi implements Source
{
  Client client = Client();
  Future<List<int>> topIds() async
  {
    final ids = await client.get('$_root/topstories.json');
    final parsedids = json.decode(ids.body);
    return parsedids.cast<int>();
  }
  Future<ItemModel> fetchItem(int ids) async
  {
    final data = await client.get('$_root/item/$ids.json');
    final parsedData = json.decode(data.body);
    return ItemModel.fromJson(parsedData);
  }
}





