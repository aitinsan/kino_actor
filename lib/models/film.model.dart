class Film {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List characters;
  final List planets;
  final List starships;
  final List vehicles;
  final List species;
  final String created;
  final String edited;
  final String url;

  Film({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        title: json['title'],
        episodeId: json['episode_id'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: json['release_date'],
        characters: json['characters'],
        planets: json['planets'],
        starships: json['starships'],
        vehicles: json['vehicles'],
        species: json['species'],
        created: json['created'],
        edited: json['edited'],
        url: json['url']);
  }
}
