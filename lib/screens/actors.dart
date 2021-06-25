import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/pagination.dart';
import 'package:kino_actor/models/people.dart';

Future<List<People>> fetchPeople(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://swapi.dev/api/people/?page=2'),
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    },
  );

  final result = Pagination.fromJson(
      jsonDecode(response.body),
    ).results;
  return result;
}

//функция которая конвертирует респонс в лист актеров
// List<People> parsePeople(List<People> peoples) {
//   print('start parse');
//   print('responseBody $peoples');
//   return List<People>.from(
//       peoples.map<People>(
//         (json) => People.fromJson(json),
//       )
//       .toList());
// }

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      FutureBuilder<List<People>>(
        future: fetchPeople(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return PeopleList(peoples: snapshot.data!);
              
              
        },
      ),
    ]);
  }
}

class PeopleList extends StatelessWidget {
  List<People> peoples;
  PeopleList({Key? key, required this.peoples}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    print('name ${peoples[0].name}');
    return Expanded(child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: peoples.length,
      itemBuilder: (context, index) {
        return Text(
          peoples[index].name,
        );
      },
    ));
  }
}
