import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors_list_counter.dart';
import 'package:kino_actor/models/searched_list_of_people.dart';
import 'package:provider/provider.dart';
import '../Navigation.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => ActorsListCounter(),),
        ChangeNotifierProvider(create: (_) => SearchedActorsListCounter('l'),),
        
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
