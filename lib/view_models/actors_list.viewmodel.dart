
import 'package:flutter/cupertino.dart';
import 'package:kino_actor/models/pagination.model.dart';
import 'package:kino_actor/models/paginator.dart';
import 'package:kino_actor/models/actors.model.dart';
import 'package:kino_actor/repository/backendActors.dart';


//класс для показа актеров

class ActorsListViewModel extends ChangeNotifier{
  
  late List<Actor> _allPeople;
  late Paginator _paginator;
  ActorsListViewModel(){
    _allPeople = [];
    _paginator = Paginator();
  }
  
  List<Actor> get allPeople => _allPeople;
  
  void getNextPage() async {
    
    final Pagination pagination = await _paginator.getNextPage('/people');

    _allPeople += pagination.results.map((e) => Actor.fromJson(e)).toList();
    notifyListeners();
  }
  bool get isNextExist => _paginator.isNextExists;

  
}