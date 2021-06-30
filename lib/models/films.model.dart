class Films {
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

  Films(
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  );

  factory Films.fromJson(Map<String, dynamic> json) {
    return Films(
        json['title'],
        json['episode_id'],
        json['opening_crawl'],
        json['director'],
        json['producer'],
        json['release_date'],
        json['characters'],
        json['planets'],
        json['starships'],
        json['vehicles'],
        json['species'],
        json['created'],
        json['edited'],
        json['url']);
  }
}
