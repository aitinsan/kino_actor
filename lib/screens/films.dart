import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/pagination.dart';
import 'package:kino_actor/models/film.dart';
import 'dart:convert' as convert;

import 'package:kino_actor/models/people.dart';

Future<Pagination> fetchPaginationPeople(int countNumber) async {
  final response = await http
      .get(Uri.parse('https://swapi.dev/api/people/?page=$countNumber'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pagination.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class FilmsPage extends StatefulWidget {
  FilmsPage({Key? key}) : super(key: key);

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
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

      SomeCards() //NewCard()
    ]);
  }
}

class SomeCards extends StatefulWidget {
  SomeCards({Key? key}) : super(key: key);

  @override
  _SomeCardsState createState() => _SomeCardsState();
}

class _SomeCardsState extends State<SomeCards> {
  Future<Pagination> futurePagination = fetchPaginationPeople(2);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: FutureBuilder<Pagination>(
          future: futurePagination,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.results);
              return Text(snapshot.data!.next);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}



