import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/pagination.dart';
import 'package:kino_actor/models/people.dart';

class ResponseClass {
  final String _response;
  ResponseClass(this._response, this.client);
  http.Client client;

  Future<http.Response> _getResponse() async {
    //final isResponse = await http.Client().get(Uri.parse(_response),);
    http.Response _someResponse = await client.get(
      Uri.parse(_response),
    );
    return _someResponse;
  }

  //Future<http.Response> get _someResponse async => await http.Client().get(Uri.parse(_response),);
  //Future<>get response async => await http.Client().get(Uri.parse(_response!),);
  Future<Pagination> get paginationData async => Pagination.fromJson(
        jsonDecode(
          (await _getResponse()).body,
        ),
      );

  Future<List<People>> get someListOfPeople async =>
      (await paginationData).results;

  Future<bool> _isNextExist() async {
    if ((await paginationData).next != null) {
      print("there wrote true");
      return true;
    } else
      print("there False");
      return false;

  }

  Future<bool> get isNextExist async => await _isNextExist();
}
