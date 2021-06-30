import 'dart:convert';

import 'package:kino_actor/base/http.dart';

import 'package:kino_actor/models/actors.model.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/pagination.model.dart';




// для того чтобы достать людей с пейджа
// Future<List<Actors>> getPeople() async {
//   final query =
//   final http.Response response = await Http.get('/people',query);
//   final Pagination pagination = Pagination.fromJson(jsonDecode(response.body));



//   return pagination.results.map((e) => Actors.fromJson(e)).toList();
  
//   /*return await ActorsResponse('$ALL_ACTORS_PAGE$pageIndex', client)
//       .someListOfPeople();*/
// }

//функция проверяет есть ли следующая страница
/*Future<bool> fetcNext(http.Client client, int pageIndex) async {
  return await ActorsResponse('$ALL_ACTORS_PAGE$pageIndex', client).isNextExist;
}

//для того чтобы достать людей с поиска
Future<List<Actors>> fetchSearchPeople(
    http.Client client, int pageIndex, String keyword) async {
  List<Actors> someResult = await ActorsResponse(
          '$SEARCH_PEOPLE_PAGE$keyword&page=$pageIndex', client)
      .someListOfPeople();
  return someResult;
}

//функция проверяет есть ли следующая страница по поиску
Future<bool> fetchSeacrhNext(
    http.Client client, int pageIndex, String keyword) async {
  return await ActorsResponse(
          '$SEARCH_PEOPLE_PAGE$keyword&page=$pageIndex', client)
      .isNextExist;
}
*/