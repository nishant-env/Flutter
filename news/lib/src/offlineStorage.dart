import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'models.dart';
import 'repository.dart';

class Offline implements Cache,Source
{
  Database db;
  Offline(){
    init();
  }
  Future<List<int>> topIds(){return null;}
  void init() async{
    String documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory,'items1.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) async {
  await newDb.execute("""
          CREATE TABLE Items
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
        """);
      }

      
    );


  } 
Future<ItemModel> fetchItem(int id) async{
  final maps = await db.query(
    "Items",
    columns: null,
    where: "id=?",
    whereArgs: [id],
      );

    if (maps.length > 0)
    {
      return ItemModel.fromDb(maps.first);
    }
    return null;

}
Future<int> addItem(ItemModel item)
{
  return db.insert("Items", item.toMapforDb(),
  conflictAlgorithm: ConflictAlgorithm.ignore,);
}

Future<int> clear()
{
  return db.delete("Items");
}

}
final offline = Offline();