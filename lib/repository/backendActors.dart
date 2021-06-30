import 'package:kino_actor/constants.dart';
import 'package:kino_actor/models/actors.model.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/actors_response.model.dart';

//для того чтобы достать людей с пейджа
Future<List<Actors>> fetchPeople(http.Client client, int pageIndex) async {
  return await ActorsResponse('$ALL_ACTORS_PAGE$pageIndex', client)
      .someListOfPeople();
}

//функция проверяет есть ли следующая страница
Future<bool> fetcNext(http.Client client, int pageIndex) async {
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
