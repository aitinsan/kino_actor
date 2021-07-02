class AppPage<T> {
  int? count;
  var next;
  var previous;

  List<T> results;

  AppPage({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory AppPage.fromJson(
    Map<String, dynamic> json,
  ) {
    return AppPage(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] == null ? [] as List<T> : json['results'] as List<T>,
    );
  }
}