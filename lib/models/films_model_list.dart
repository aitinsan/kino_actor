import 'package:kino_actor/models/films.dart';
import 'package:kino_actor/models/pagination.dart';

class FilmsModelList extends Pagination {
  List<Films> results;
  FilmsModelList(
    this.results,
  ) : super(Map());
  factory FilmsModelList.fromJson(
    Map<String, dynamic> json,
  ) {
    //проверяет на нулл не нулл
    final test = json['results'] == null ? [] : json['results'] as List;

    List<Films> items = test.map((e) => Films.fromJson(e)).toList();
    return FilmsModelList(
      items,
    );
  }
}
