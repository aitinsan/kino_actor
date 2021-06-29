import 'package:kino_actor/models/responce.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/actors.dart';
import 'package:kino_actor/models/actors_model_list.dart';

class ActorsResponse extends ResponseClass {
  ActorsResponse(String response, http.Client client) : super(response, client);

  Future<ActorsModelList> peoplePaginationData() async {
    return ActorsModelList.fromJson(
      jsonDecode(
        (await getResponse()).body,
      ),
    );
  }

  /*Future<List<People>> get someListOfPeople async =>
      (await peoplePaginationData()).results;
  */
  Future<List<Actors>> someListOfPeople() async {
    return (await peoplePaginationData()).results;
  }

  Future<bool> _isNextExist() async {
    if ((await peoplePaginationData()).next != null) {
      return true;
    } else
    return false;
  }

  Future<bool> get isNextExist async => await _isNextExist();
}
