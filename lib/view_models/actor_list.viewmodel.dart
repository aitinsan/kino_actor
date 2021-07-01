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

  void getNextPage() async {
    final AppPage pagination = await _paginator.getNextPage(
      '/people',
      'page=',
    );

    _allPeople += pagination.results.map((e) => Actor.fromJson(e)).toList();
    notifyListeners();
  }

  bool get doesNextExist => _paginator.doesNextExists;
}
