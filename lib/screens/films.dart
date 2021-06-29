import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/films_list.dart';
import 'package:kino_actor/widgets/films_search.dart';

class FilmsPage extends StatefulWidget {
  FilmsPage({Key? key}) : super(key: key);

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      
      FilmsSearch(),
      Expanded(
        child: FilmsList(),
      ), 
    ]);
  }
}
