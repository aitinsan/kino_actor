import 'package:flutter/material.dart';
import 'package:kino_actor/models/people.dart';
import 'package:kino_actor/repository/backend.dart';
import 'package:http/http.dart' as http;

//класс для показа актеров
class SearchedActorsListCounter with ChangeNotifier {
  List<People> _allPeople = [];
  String _keyword;
  SearchedActorsListCounter(this._keyword);
  int _pageIndex = 0;
  bool _isNextExists = true;

  //set keywordText(String text) => _keyword;
  String get keywordText => _keyword;
  int get pageIndex => _pageIndex;
  Future<bool> checkNext(String keyword) async {
    return fetchSeacrhNext(http.Client(), _pageIndex, keyword);
  }

  //выводит данные с одной страницы
  Future<List<People>> addForList(String keyword) async {
    return fetchSearchPeople(http.Client(), _pageIndex, keyword);
  }

  void changeSearch(String keyText) async {

    _keyword = keyText;

    _isNextExists = await checkNext(_keyword);
    _allPeople = await addForList(_keyword);
    notifyListeners();
  }

  void increment() async {
    _pageIndex++;
    _isNextExists = await checkNext(_keyword);
    _allPeople += await addForList(_keyword);
    notifyListeners();
    
  }

  bool get isNextExist => _isNextExists;

  List<People> get allPeople => _allPeople;
}
