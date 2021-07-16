import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/animation_slider.dart';
import 'package:kino_actor/audio_recorder/audio_recorder_page.screen.dart';
import 'package:kino_actor/screens/actors_page.screen.dart';
import 'package:kino_actor/screens/films_page.screen.dart';
import 'package:kino_actor/tab_page.dart';
import 'package:path_provider/path_provider.dart';

//Виджеты для главной страницы с фильмами, актерами и поиском
class NavigationAppPage extends StatefulWidget {
  NavigationAppPage({Key? key, required this.initialPage}) : super(key: key);
  final TabPage initialPage;
  @override
  _NavigationAppPageState createState() => _NavigationAppPageState();
}

class _NavigationAppPageState extends State<NavigationAppPage> {
  TabPage _currentPage = TabPage.FilmsPage;
  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final _tabs = {
      TabPage.ActorsPage: ActorsPage(),
      TabPage.FilmsPage: FilmsPage(),
      TabPage.AnimationSlider: AnimationAll(),
      TabPage.AudioRecorderPage: AudioRecorderPage(),
    };
    return Scaffold(
      body: _tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'actors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation_sharp),
            label: 'animation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'audio',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _currentPage.index,
        selectedItemColor: Theme.of(context).cardColor,
        unselectedItemColor: Theme.of(context).cardColor,
        onTap: (i) => setState(() => _currentPage = TabPage.values[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}