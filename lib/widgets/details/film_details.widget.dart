import 'package:flutter/material.dart';
import 'package:kino_actor/models/film.model.dart';

class FilmDetails extends StatelessWidget {
  Film film;
  FilmDetails({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Title: ${film.title}'),
            Text('Director: ${film.director}'),
            Text('Episode number: ${film.episodeId}'),
            //Text('Producers: ${film.producer}'),
            Text('\n\nOpening crawl: \n ${film.openingCrawl}'),
          ],
        ),
      ),
    );
  }
}
