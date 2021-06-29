import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/actors_searched_items.dart';

class SearchedPeopleScreen extends StatelessWidget {
  const SearchedPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: 
        //backwardsCompatibility: false,
        title: Text('Searched Actors'),
        backgroundColor: Color(0xFF670974),
      ),
      body: ActorsSearchedItems(),
    );
  }
}
