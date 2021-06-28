import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/people_list.dart';

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextField(
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
              child: Icon(
                Icons.search,
                color: Colors.black.withAlpha(120),
              ))
        ],
      ),

      Expanded(
        child: PeopleList(),
      ), 
    ]);
  }
}


