
import 'package:flutter/cupertino.dart';
import 'package:kino_actor/models/films.model.dart';
import 'package:kino_actor/models/pagination.model.dart';
import 'package:kino_actor/models/paginator.dart';

class FilmsListViewModel extends ChangeNotifier{
  
  late List<Film> _allFilms;
  late Paginator _paginator;


  FilmsListViewModel(){
    _allFilms = [];
    _paginator = Paginator();
  }
  
  List<Film> get allFilms => _allFilms;
  
  void getNextPage() async {
    
    final Pagination pagination = await _paginator.getNextPage('/films');

    _allFilms += pagination.results.map((e) => Film.fromJson(e)).toList();
    notifyListeners();
  }
  bool get isNextExist => _paginator.isNextExists;

  
}