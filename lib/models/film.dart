import 'package:flutter/material.dart';

class Films {
  final String title;
  final int episode_id;
  final String opening_crawl;
  final String director;
  final String producer;
  final String elease_date;
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
    this.episode_id,
    this.opening_crawl,
    this.director,
    this.producer,
    this.elease_date,
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


/*class Card extends StatefulWidget {
  Card({Key? key}) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  late Future<Films> futureFilm;

  @override
  void initState() {
    super.initState();
    futureFilm = fetchFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<Films>(
      future: futureFilm,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    ));
  }
}

*/