import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors_list_search.model.dart';
import 'package:kino_actor/screens/actors_searched.screen.dart';
import 'package:provider/provider.dart';

class ActorsSearch extends StatefulWidget {
  ActorsSearch({Key? key}) : super(key: key);

  @override
  _ActorsSearchState createState() => _ActorsSearchState();
}

class _ActorsSearchState extends State<ActorsSearch> {
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
                Provider.of<ActorsListSearch>(context, listen: false)
                    .cleanPeoples();
                Provider.of<ActorsListSearch>(context, listen: false)
                    .changeSearch(textController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActorsSearchedScreen()),
                );
              },
            ),
          ),
        ]),
      ],
    );
  }
}
