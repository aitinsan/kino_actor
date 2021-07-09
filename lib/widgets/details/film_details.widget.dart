import 'package:flutter/material.dart';
import 'package:kino_actor/models/film.model.dart';
import 'package:kino_actor/widgets/details/deteils_row.dart';
import 'package:kino_actor/widgets/divider.dart';

class FilmDetails extends StatelessWidget {
  final Film film;
  FilmDetails({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          film.title,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // <-- wrap this around
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            borderOnForeground: false,
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailsRow(
                    titleOfItem: 'Title',
                    item: '${film.title}',
                  ),
                  divider,
                  DetailsRow(
                    titleOfItem: 'Created',
                    item:
                        '${film.created.day}/${film.created.month}/${film.created.year}',
                  ),
                  divider,
                  DetailsRow(
                    titleOfItem: 'Edited',
                    item:
                        '${film.edited.day}${film.edited.month}${film.edited.year}',
                  ),
                  divider,
                  DetailsRow(
                    titleOfItem: 'Title',
                    item: '${film.director}',
                  ),
                  divider,
                  DetailsRow(
                    titleOfItem: 'Episode number',
                    item: '${film.episodeId}',
                  ),
                  divider,
                  DetailsRow(
                    titleOfItem: 'Release date',
                    item: '${film.releaseDate}',
                  ),
                  divider,
                  Text(
                    '\nOpening crawl\n ',
                    style: TextStyle(fontSize: 19, color: Colors.black54),
                  ),
                  Text(
                    '${film.openingCrawl}',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}