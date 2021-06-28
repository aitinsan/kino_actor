import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/people_list.dart';
import 'package:kino_actor/widgets/search_actors.dart';

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SearchActors(),
      Expanded(
        child: PeopleList(),
      ), 
    ]);
  }
}


