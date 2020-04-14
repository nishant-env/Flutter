import 'dart:convert';
import 'package:http/http.dart';
import 'package:news/src/resourse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';



main()
{
  test('testing',() async {
  final newsapi = NewsApi();
  newsapi.client= MockClient((request) async{
    return Response(json.encode([1,2,3,4,5]),200);
  });
  var id1 = await newsapi.topIds();
  
  expect(id1, [1,2,3,4,5]);

  });
  test('test',()async{
    final newsapi = NewsApi();
    newsapi.client = MockClient((request) async{
      final data = {'deleted':true};
      return Response(json.encode(data),200);
    });
final nisan=await newsapi.fetchItem(123);
expect(nisan.deleted, true);
  });

}