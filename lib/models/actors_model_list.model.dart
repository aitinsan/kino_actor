import 'package:kino_actor/models/pagination.model.dart';
import 'package:kino_actor/models/actors.model.dart';

class ActorsModelList extends Pagination {
  List<Actors> results;
  ActorsModelList(
    this.results,
  ) : super(Map());
  factory ActorsModelList.fromJson(
    Map<String, dynamic> json,
  ) {
    //проверяет на нулл не нулл
    final test = json['results'] == null ? [] : json['results'] as List;

    List<Actors> items = test.map((e) => Actors.fromJson(e)).toList();
    return ActorsModelList(
      items,
    );
  }
}
