class Pagination {
  int? count;
  var next;
  var previous;

  List results;

  Pagination({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory Pagination.fromJson(
    Map<String, dynamic> json,
  ) {
    //T itemConverter
    //проверяет на нулл не нулл
    final results = json['results'] == null ? [] : json['results'] as List;

    return Pagination(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: results,
    );
  }
}


//List<People> itemConverter = People.fromJson(e));