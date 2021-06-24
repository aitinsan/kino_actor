import 'package:flutter/material.dart';
import 'package:kino_actor/models/film.dart';
import 'package:kino_actor/screens/films.dart';
import '../Navigation.dart';
import 'models/pagination.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
//строю приложение через MaterialApp()
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kinoactor',
      //theme:
      home: NavigationAppPage(initialPage: 'films',),
    );
    
  }
}
