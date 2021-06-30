import 'dart:convert';

import 'package:kino_actor/base/http.dart';
import 'package:kino_actor/models/pagination.model.dart';

import 'package:http/http.dart' as http;

class Paginator {
  int pageIndex = 0;
  bool isNextExists = true;

  int get pageIndexNumber => pageIndex;
  /*Future<bool> checkNext() async {
    return fetcNext(http.Client(), pageIndex);
  }*/

  Future<Pagination> getNextPage(url) async {
    pageIndex++;
    final query = 'page=$pageIndex';
    final http.Response response = await Http.get(url, query);

    final Pagination pagination =
        Pagination.fromJson(jsonDecode(response.body));
    if (pagination.next != null) {
      isNextExists = true;
    } else {
      isNextExists = false;
    }
    return pagination;
  }
  //выводит данные с одной страницы

  //List<People> get allPeople => _allPeople;
}
