import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/animation_slider.dart';
import 'package:kino_actor/animation_slider/for_test.dart';
//import 'package:kino_actor/animation_slider/for_test.dart';

import 'package:kino_actor/lightTheme.dart';

import 'package:provider/provider.dart';

void main() {
  MultiProvider(providers: [
    ChangeNotifierProvider<AppThemeNotifier>(
        create: (_) => AppThemeNotifier(AppTheme.lightTheme),
        child: MyApp(),
      ),
  ],);
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// //строю приложение через MaterialApp()
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kinoactor',

//       theme: AppTheme.lightTheme,

//       home: NavigationAppPage(
//         initialPage: TabPage.ActorsPage,
//       ), //MyHomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationRotate(),//AnimationSlider(),
    );
  }
}
