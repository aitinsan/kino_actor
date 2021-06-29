import 'package:flutter/material.dart';
import 'package:kino_actor/screens/actors.dart';
import 'package:kino_actor/screens/films.dart';

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
      appBar: AppBar(
        title: Text('kinoacter'),
        backgroundColor: Color(0xFF670974),
      ),
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.movie), label: 'films'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'actors'),
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF670974),
        unselectedItemColor: Color(0x8A000000),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}