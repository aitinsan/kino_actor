import 'package:flutter/material.dart';
import 'package:kino_actor/models/film.model.dart';
import 'package:kino_actor/models/app_page.model.dart';
import 'package:kino_actor/models/paginator.dart';

class FilmListViewModel extends ChangeNotifier {
  late List<Film> _allFilms;
  late Paginator _paginator;

  FilmListViewModel() {
    _allFilms = [];
    _paginator = Paginator();
  }

  List<Film> get allFilms => _allFilms;
  //// достает список людей 
  // void getAllFilmsNextPage() async {
  //   final AppPage pagination = await _paginator.getNextPage(
  //     url: '/films',
  //     query: 'page=',
  //   );

  //   extendAllPeopleList(pagination);
  // }
  //// достает список людей по поиску 
  void getSearchedFilmsNextPage(String keyboard) async {
    final AppPage pagination = await _paginator.getNextPage(
      url:'/films',
      query:'search=$keyboard&page=',
    );
    extendAllPeopleList(pagination);
    
  }
  void extendAllPeopleList(final AppPage pagination){
    _allFilms += pagination.results.map((e) => Film.fromJson(e)).toList();
    notifyListeners();
  }
  void cleanFilmList(){
    _paginator.cleanPage();
    _allFilms = [];
  }

  bool get doesNextExist => _paginator.doesNextExists;
}
