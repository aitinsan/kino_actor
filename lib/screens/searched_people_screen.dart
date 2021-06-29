import 'package:flutter/material.dart';
import 'package:kino_actor/models/searched_list_of_people.dart';
import 'package:kino_actor/widgets/actors_searched_items.dart';
import 'package:provider/provider.dart';

class SearchedPeopleScreen extends StatelessWidget {
  const SearchedPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                
                Navigator.pop(context);

              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        //backwardsCompatibility: false,
        title: Text('Searched Actors'),
        backgroundColor: Color(0xFF670974),
      ),
      body: ActorsSearchedItems(),
    );
  }
}
