import 'dart:convert';

import 'package:kino_actor/base/http.dart';
import 'package:kino_actor/models/app_page.model.dart';

import 'package:http/http.dart' as http;

class Paginator {
  int _pageIndex = 0;
  bool _doesNextExists = true;
  int get pageIndexNumber => _pageIndex;
  bool get doesNextExists => _doesNextExists;
  Future<AppPage> getNextPage(url,query) async {
    _pageIndex++;
    final fullQuery= '$query$_pageIndex';
    final http.Response response = await Http.get(url, fullQuery);

    final AppPage pagination =
        AppPage.fromJson(jsonDecode(response.body));
    if (pagination.next != null) {
      _doesNextExists = true;
    } else {
      _doesNextExists = false;
    }
    return pagination;
  }
}
