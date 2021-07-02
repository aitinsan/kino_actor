import 'package:flutter/material.dart';
import 'package:kino_actor/models/app_page.model.dart';
import 'package:kino_actor/models/paginator.dart';
import 'package:kino_actor/models/actor.model.dart';

class ActorListViewModel extends ChangeNotifier {
  late List<Actor> _allPeople;
  late Paginator _paginator;
  ActorListViewModel() {
    _allPeople = [];
    _paginator = Paginator();
  }

  List<Actor> get allPeople => _allPeople;
  
  //достает список людей по поиску
  void getSearchedPeopleNextPage(String keyboard) async {
    final AppPage pagination = await _paginator.getNextPage(
      url: '/people',
      query: 'search=$keyboard&page=',
    );

    extendAllPeopleList(pagination);
  }

  //расширяет список актеров. использую в getAllPeopleNextPage() и getSearchedPeopleNextPage()
  void extendAllPeopleList(final AppPage pagination) {
    _allPeople += pagination.results.map((e) => Actor.fromJson(e)).toList();
    notifyListeners();
  }

  void cleanAllPeopleList() {
    _paginator.cleanPage();
    _allPeople = [];

  }

  bool get doesNextExist => _paginator.doesNextExists;
}
