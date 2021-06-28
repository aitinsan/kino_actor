import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kino_actor/models/people.dart';
import 'package:kino_actor/repository/backend.dart';
import 'package:http/http.dart' as http;

//класс для показа актеров
class ActorsListCounter with ChangeNotifier {
  List<People> _allPeople = [];

  int _pageIndex = 0;
  bool _isNextExists = true;
  
  int get pageIndex => _pageIndex;
  Future<bool> checkNext() async{
    return await fetcNext(http.Client(), _pageIndex);
  }
  //выводит данные с одной страницы
  Future<List<People>> addForList() async {
    return await fetchPeople(http.Client(), _pageIndex);
  }


  void increment() async {
    _pageIndex++;
    _isNextExists = await checkNext();
    _allPeople += await addForList();
    notifyListeners();
  }
  bool get isNextExist => _isNextExists;
  
  List<People> get allPeople => _allPeople;



}
