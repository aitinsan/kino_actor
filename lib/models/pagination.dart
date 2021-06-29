import 'package:kino_actor/models/people.dart';

class Pagination {
  int? count;
  var next;
  var previous;
  List<People> results;

  Pagination({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    //проверяет на нулл не нулл
    final test = json['results'] == null ? [] : json['results'] as List;
    
    
      List<People> items = test.map((e) => People.fromJson(e)).toList();
    return Pagination(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: items,
    );
  }
}
