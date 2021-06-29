import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors_list_search.dart';
import 'package:kino_actor/widgets/actors_searched_items.dart';
import 'package:provider/provider.dart';

class ActorsSearchedScreen extends StatelessWidget {
  const ActorsSearchedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Provider.of<ActorsListSearch>(context, listen: false)
                    .cleanPeoples();
                Navigator.pop(context);
              },
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
