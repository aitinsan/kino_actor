import 'package:flutter/material.dart';
import 'package:kino_actor/view_models/film_list.viewmodel.dart';
import 'package:kino_actor/widgets/film_list.widget.dart';
import 'package:provider/provider.dart';

class FilmsPage extends StatefulWidget {
  FilmsPage({Key? key}) : super(key: key);

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ChangeNotifierProvider<FilmListViewModel>(
            create: (context) => FilmListViewModel(),
            child: FilmsList(),
          ),
        ),
      ],
    );
  }
}
