import 'package:flutter/material.dart';
import 'package:kino_actor/models/searched_list_of_people.dart';
import 'package:kino_actor/screens/searched_people_screen.dart';
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
                Provider.of<SearchedActorsListCounter>(context,listen: false).cleaPeoples();
                Provider.of<SearchedActorsListCounter>(context,listen: false).changeSearch(textController.text);
                print(context.read<SearchedActorsListCounter>().keywordText);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchedPeopleScreen()),);
                
              },
            ),
          ),
        ]),
      ],
    );
  }
}
