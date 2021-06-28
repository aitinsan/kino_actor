import 'package:flutter/material.dart';
import 'package:kino_actor/models/people.dart';

class PeopleList extends StatelessWidget {
  List<People> peoples;
  PeopleList({Key? key, required this.peoples}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(peoples);
    print(peoples.length);
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: peoples.length,
      itemBuilder: (context, index) {
        return Text(
          peoples[index].name,
        );
      },
    );
  }
}