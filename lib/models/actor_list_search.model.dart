// import 'package:kino_actor/models/actor.model.dart';
// import 'package:kino_actor/models/list_search.model.dart';
// import 'package:kino_actor/repository/backendActors.dart';
// import 'package:http/http.dart' as http;


// class ActorsListSearch extends ListSearch {
//   ActorsListSearch(String keyword) : super(keyword);
//   List<Actors> _allActors = [];
//   List<Actors> get allPeople => _allActors;
//   //выводит данные с одной страницы
//   Future<List<Actors>> addForList(String keyword) async {
//     return fetchSearchPeople(http.Client(), pageIndex, keyword);
//   }

//   void changeSearch(String keyText) async {
//     keyword = keyText;

//      isNextExists = await checkNext(keyword);
//      _allActors = await addForList(keyword);
//     notifyListeners();
//   }

//   void cleanPeoples() {
//     _allActors = [];
//     pageIndex = 0;
//     notifyListeners();
//   }

//   void increment() async {
//     pageIndex++;
//     isNextExists = await checkNext(keyword);
//     _allActors += await addForList(keyword);
//     notifyListeners();
//   }
//   Future<bool> checkNext(String keyword) async {
//     return fetchSeacrhNext(http.Client(), pageIndex, keyword);
//   }
  
// }
