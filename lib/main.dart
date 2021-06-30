import 'package:flutter/material.dart';
import 'package:kino_actor/view_models/actors_list.viewmodel.dart';
import 'package:kino_actor/models/list_search.model.dart';
import 'package:kino_actor/navigation.dart';
import 'package:kino_actor/view_models/films_list.viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        //list counters
        
        ChangeNotifierProvider(
          create: (_) => ActorsListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => FilmsListViewModel(),
        ),
        //list seacrhes
        ChangeNotifierProvider(
          create: (_) => ListSearch(''),
        ),
        
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
      home: NavigationAppPage(
        initialPage: 'films',
      ), //MyHomePage(),
    );
  }
}
