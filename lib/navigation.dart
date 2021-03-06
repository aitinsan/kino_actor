import 'package:flutter/material.dart';
import 'package:kino_actor/lightTheme.dart';
import 'package:kino_actor/screens/actors_page.screen.dart';
import 'package:kino_actor/screens/films_page.screen.dart';

enum Tabs {
  FilmsPage,
  ActorsPage,
}

//Виджеты для главной страницы с фильмами, актерами и поиском
class NavigationAppPage extends StatefulWidget {
  NavigationAppPage({Key? key, required this.initialPage}) : super(key: key);
  final Tabs initialPage;
  @override
  _NavigationAppPageState createState() => _NavigationAppPageState();
}

class _NavigationAppPageState extends State<NavigationAppPage> {
  Tabs _currentPage = Tabs.FilmsPage;
  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  

  @override
  Widget build(BuildContext context) {
    final _tabs = {
    Tabs.ActorsPage: ActorsPage(),
    Tabs.FilmsPage: FilmsPage(),
  };
    return Scaffold(
      body: _tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'films'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'actors'),
        ],
        backgroundColor:AppTheme.lightTheme.primaryColor,
        currentIndex: _currentPage.index,
        selectedItemColor: AppTheme.lightTheme.cardColor,
        unselectedItemColor: AppTheme.lightTheme.cardColor,
        onTap: (i) => setState(() => _currentPage = Tabs.values[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
