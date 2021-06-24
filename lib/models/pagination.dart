import 'package:kino_actor/models/people.dart';

class Pagination {
  int? count;
  var next;
  var previous;
  List<People>? results;

  Pagination({
    this.count,
    this.next,
    this.previous,
    this.results,
  
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      count: json['count'],
      next: json['next'],
      previous:json['previous'],
      results: 
    );
  }
}
