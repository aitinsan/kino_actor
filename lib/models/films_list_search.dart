import 'package:kino_actor/models/films.dart';
import 'package:kino_actor/models/list_search.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/repository/backendFilms.dart';


class FilmsListSearch extends ListSearch {
  FilmsListSearch(String keyword) : super(keyword);
  List<Films> _allFilms = [];
  List<Films> get allFilms => _allFilms;
  //выводит данные с одной страницы
  Future<List<Films>> addForList(String keyword) async {
    return fetchSearchFilms(http.Client(), pageIndex, keyword);
  }

  void changeSearch(String keyText) async {
    keyword = keyText;

    isNextExists = await checkNext(keyword);
    _allFilms = await addForList(keyword);
    notifyListeners();
  }

  void cleanFilms() {
    _allFilms = [];
    pageIndex = 0;
    notifyListeners();
  }

  void increment() async {
    pageIndex++;
    isNextExists = await checkNext(keyword);
    _allFilms += await addForList(keyword);
    notifyListeners();
  }
  Future<bool> checkNext(String keyword) async {
    return fetchSeacrhNext(http.Client(), pageIndex, keyword);
  }
  
}
