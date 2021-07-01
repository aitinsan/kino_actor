import 'package:kino_actor/constants.dart';
import 'package:kino_actor/models/film.model.dart';
import 'package:http/http.dart' as http;

/*
Future<List<Films>> fetchFilms(http.Client client, int pageIndex) async {
  return await FilmsResponse('$ALL_FILMS_PAGE$pageIndex', client)
      .someListOfFilms();
}

//функция проверяет есть ли следующая страница
Future<bool> fetcNext(http.Client client, int pageIndex) async {
  return await FilmsResponse('$ALL_FILMS_PAGE$pageIndex', client).isNextExist;
}

//для того чтобы достать фильмы с поиска
Future<List<Films>> fetchSearchFilms(
    http.Client client, int pageIndex, String keyword) async {
  List<Films> someResult =
      await FilmsResponse('$SEARCH_FILMS_PAGE$keyword&page=$pageIndex', client)
          .someListOfFilms();
  return someResult;
}

//функция проверяет есть ли следующая страница по поиску
Future<bool> fetchSeacrhNext(
    http.Client client, int pageIndex, String keyword) async {
  return await FilmsResponse(
          '$SEARCH_FILMS_PAGE$keyword&page=$pageIndex', client)
      .isNextExist;
}
*/