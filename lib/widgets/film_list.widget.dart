import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/models/film.model.dart';
import 'package:kino_actor/view_models/film_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:provider/provider.dart';

class FilmsList extends StatefulWidget {
  FilmsList({Key? key}) : super(key: key);

  @override
  _FilmsListState createState() => _FilmsListState();
}

class _FilmsListState extends State<FilmsList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      context.read<FilmListViewModel>().getNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Film> films = context.watch<FilmListViewModel>().allFilms;
    return Column(
      children: [
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
              child: Text(
                'All Starwars Movies:',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        const Divider(
          height: 3,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            controller: _controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            itemCount: films.length + 1,
            itemBuilder: (context, index) {
              if (context.watch<FilmListViewModel>().doesNextExist &&
                  films.length == 10) {
                if (films.length == 0) {
                  context.read<FilmListViewModel>().getNextPage();
                }
                if (films.length == index && films.length % 10 == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return AppCard(items: [
                    AppCardItem(films[index].title, 20),
                  ]);
              } else {
                if (films.length == 0) {
                  context.read<FilmListViewModel>().getNextPage();
                }
                if (films.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return AppCard(items: [
                    AppCardItem(films[index].title, 20),
                  ]);
              }
            },
          ),
        ),
      ],
    );
  }
}
