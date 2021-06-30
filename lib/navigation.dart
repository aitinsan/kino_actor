import 'package:flutter/material.dart';
import 'package:kino_actor/colors.dart';
import 'package:kino_actor/screens/actors.screen.dart';
import 'package:kino_actor/screens/films.screen.dart';

//Виджеты для главной страницы с фильмами, актерами и поиском
class NavigationAppPage extends StatefulWidget {
  NavigationAppPage({Key? key, required this.initialPage}) : super(key: key);
  final String initialPage;
  @override
  _NavigationAppPageState createState() => _NavigationAppPageState();
}

class _NavigationAppPageState extends State<NavigationAppPage> {
  String _currentPage = 'films';
  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'films': FilmsPage(),
      'actors': ActorsPage(),
    };
    return Scaffold(
      /*appBar: AppBar(
        title: Text('kinoacter'),
        backgroundColor: Colours.blackColor,
      ),*/
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'films'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'actors'),
        ],
        backgroundColor: Colours.blackColor,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Colours.whiteColor,
        unselectedItemColor: Colours.whiteColor,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
