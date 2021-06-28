import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kino_actor/models/people.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/pagination.dart';





//для того чтобы достать людей с пейджа
Future<List<People>> fetchPeople(http.Client client, int pageIndex) async {
  
  final response = await client.get(
    Uri.parse('https://swapi.dev/api/people/?page=$pageIndex'),
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    },
  );

  final result = Pagination.fromJson(
    jsonDecode(response.body),
  ).results;
  //add
  //print(result);
  return result;
  
}

/*List<People> addAllPeople(){
  List<People> allTemporaryPeople = List<People>.from(fetchPeople(http.Client(), pageIndex)).toList();//fetchPeople(http.Client(), pageIndex);
}*/

//функция которая конвертирует респонс в лист актеров
// List<People> parsePeople(List<People> peoples) {
//   print('start parse');
//   print('responseBody $peoples');
//   return List<People>.from(
//       peoples.map<People>(
//         (json) => People.fromJson(json),
//       )
//       .toList());
// }



class ActorsListCounter with ChangeNotifier, DiagnosticableTreeMixin{
  List<People> _allPeople=[];
  int _pageIndex = 1;
  int get pageIndex => _pageIndex;
  List<People> _temporaryList =[];
  List<People> dfsa = [];
  Future<List<People>> addForList() async{
    return  await fetchPeople(http.Client(), _pageIndex);
    
  }

  void increment() async {
    _pageIndex++;
    _allPeople += await addForList();
    //print(_allPeople);
    //print(_allPeople.length);
    notifyListeners();
  }
  List<People> get allPeople => _allPeople;
  /*@override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('pageIndex', pageIndex));
    //properties.add(StringProperty("name", allPeople.first.name));
  }*/

}