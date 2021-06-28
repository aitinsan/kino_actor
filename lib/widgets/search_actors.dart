import 'package:flutter/material.dart';

class SearchActors extends StatelessWidget {
  const SearchActors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
      );
  }
}