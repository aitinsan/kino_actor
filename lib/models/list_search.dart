import 'package:flutter/material.dart';

//класс для показа актеров
class ListSearch with ChangeNotifier {
  String keyword;
  ListSearch(this.keyword);
  int pageIndex = 0;
  bool isNextExists = true;

  //set keywordText(String text) => _keyword;
  String get keywordText => keyword;
  int get pageIndexList => pageIndex;


  bool get isNextExist => isNextExists;
}