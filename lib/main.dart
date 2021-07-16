import 'package:flutter/material.dart';

import 'package:kino_actor/lightTheme.dart';
import 'package:kino_actor/navigation.dart';
import 'package:kino_actor/tab_page.dart';

import 'package:provider/provider.dart';

void main() {
  MultiProvider(
    providers: [
      ChangeNotifierProvider<AppThemeNotifier>(
        create: (_) => AppThemeNotifier(AppTheme.lightTheme),
        child: MyApp(),
      ),
    ],
  );
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
      theme: AppThemeNotifier(AppTheme.lightTheme).getTheme(),
      home: NavigationAppPage(
        initialPage: TabPage.AudioRecorderPage,
      ),
    );
  }
}
