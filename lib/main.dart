import 'package:flutter/material.dart';
import 'package:kino_actor/lightTheme.dart';
import 'package:kino_actor/navigation.dart';

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
      
      theme: AppTheme.lightTheme,
      
      home: NavigationAppPage(
        initialPage: Tabs.ActorsPage,
      ), //MyHomePage(),
    );
  }
}
