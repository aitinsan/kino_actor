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

  void getNextPage() async {
    final AppPage pagination = await _paginator.getNextPage(
      url: '/films',
      query:'page=',
    );

    _allFilms += pagination.results.map((e) => Film.fromJson(e)).toList();
    notifyListeners();
  }

  bool get doesNextExist => _paginator.doesNextExists;
}
