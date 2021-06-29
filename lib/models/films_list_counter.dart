import 'package:kino_actor/models/films.dart';
import 'package:kino_actor/models/list_counter.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/repository/backendFilms.dart';

class FilmsListCounter extends ListCounter {
  List<Films> _allFilms = [];

  List<Films> get allFilms => _allFilms;

  void increment() async {
    pageIndex++;
    isNextExists = await checkNext();
    _allFilms += await addForList();
    notifyListeners();
  }

  Future<List<Films>> addForList() async {
    return fetchFilms(http.Client(), pageIndex);
  }
}
