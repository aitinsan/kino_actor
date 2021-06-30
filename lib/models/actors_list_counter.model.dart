import 'package:kino_actor/models/list_counter.model.dart';
import 'package:kino_actor/models/actors.model.dart';
import 'package:kino_actor/repository/backendActors.dart';
import 'package:http/http.dart' as http;

//класс для показа актеров

class ActorsListCounter extends ListCounter {
  List<Actors> _allPeople = [];

  List<Actors> get allPeople => _allPeople;

  void increment() async {
    pageIndex++;
    isNextExists = await checkNext();
    _allPeople += await addForList();
    notifyListeners();
  }

  Future<List<Actors>> addForList() async {
    return fetchPeople(http.Client(), pageIndex);
  }
}
