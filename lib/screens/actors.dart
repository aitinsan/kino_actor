import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/actors_list.dart';
import 'package:kino_actor/widgets/actors_search.dart';

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}


/*final _tabsActors = {
      'allActors': PeopleList(),
      'searchedActers': SearchedPeople(),
    };*/



class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SearchedActors(),
      /*Expanded(
          child: SearchedPeople(),
        ),*/
      Expanded(
        child: PeopleList(),
      ), 
      
    ]);
  }
}


