import 'package:flutter/material.dart';
import 'package:kino_actor/fileToTestSomthing.dart';
import 'package:kino_actor/models/film.dart';
import 'package:kino_actor/repository/backend.dart';
import 'package:kino_actor/screens/films.dart';
import 'package:provider/provider.dart';
import '../Navigation.dart';
import 'models/pagination.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ActorsListCounter()),
      ],
      child: MyApp(),
    ),
  );

  //runApp(MyApp());
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
      home: NavigationAppPage(initialPage: 'actors',),//MyHomePage(),
    );
    
  }
}
