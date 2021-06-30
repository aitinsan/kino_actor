import 'package:flutter/material.dart';
import 'package:kino_actor/repository/backendActors.dart';
import 'package:http/http.dart' as http;

class ListCounter with ChangeNotifier {
  int pageIndex = 0;
  bool isNextExists = true;

  int get pageIndexNumber => pageIndex;
  Future<bool> checkNext() async {
    return fetcNext(http.Client(), pageIndex);
  }
  //выводит данные с одной страницы

  bool get isNextExist => isNextExists;

  //List<People> get allPeople => _allPeople;
}
