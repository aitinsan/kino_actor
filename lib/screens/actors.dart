import 'package:flutter/material.dart';

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("actors"),
    );
  }
}