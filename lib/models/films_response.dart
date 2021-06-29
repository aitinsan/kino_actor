import 'package:kino_actor/models/responce.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/films.dart';
import 'package:kino_actor/models/films_model_list.dart';

class FilmsResponse extends ResponseClass {
  FilmsResponse(String response, http.Client client) : super(response, client);

  Future<FilmsModelList> filmsPaginationData() async {
    return FilmsModelList.fromJson(
      jsonDecode(
        (await getResponse()).body,
      ),
    );
  }

  /*Future<List<People>> get someListOfPeople async =>
      (await peoplePaginationData()).results;
  */
  Future<List<Films>> someListOfFilms() async {
    return (await filmsPaginationData()).results;
  }

  Future<bool> _isNextExist() async {
    if ((await filmsPaginationData()).next != null) {
      return true;
    } else
    return false;
  }

  Future<bool> get isNextExist async => await _isNextExist();
}
