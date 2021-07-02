import 'package:flutter/material.dart';
import 'package:kino_actor/colors.dart';
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
  final _tabs = {
    Tabs.ActorsPage:ActorsPage(),
    Tabs.FilmsPage: FilmsPage(),
  };


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      /*appBar: AppBar(
        title: Text('kinoacter'),
        backgroundColor: Colours.blackColor,
      ),*/
      body: _tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'films'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'actors'),
        ],
        backgroundColor: Colours.blackColor,
        currentIndex: _currentPage.index,
        selectedItemColor: Colours.whiteColor,
        unselectedItemColor: Colours.whiteColor,
        onTap: (i) => setState(() => _currentPage = Tabs.values[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
