import 'package:flutter/material.dart';
import 'package:kino_actor/models/films_list_search.dart';
import 'package:kino_actor/screens/films_searched_screen.dart';
import 'package:provider/provider.dart';

class FilmsSearch extends StatefulWidget {
  FilmsSearch({Key? key}) : super(key: key);

  @override
  _FilmsSearchState createState() => _FilmsSearchState();
}

class _FilmsSearchState extends State<FilmsSearch> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Search Films",
                hintStyle: TextStyle(
                  color: Colors.black.withAlpha(120),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {},
            ),
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black.withAlpha(120),
              ),
              onPressed: () {
                Provider.of<FilmsListSearch>(context, listen: false)
                    .changeSearch(textController.text);
                Provider.of<FilmsListSearch>(context, listen: false)
                    .cleanFilms();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilmsSearchedScreen()),
                );
              },
            ),
          ),
        ]),
      ],
    );
  }
}
