import 'package:flutter/material.dart';
import 'package:kino_actor/models/films_list_counter.model.dart';
import 'package:kino_actor/models/list_counter.model.dart';
import 'package:kino_actor/models/films.model.dart';
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

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      context.read<FilmsListCounter>().increment();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Films> films = context.watch<FilmsListCounter>().allFilms;
    print('length: ${films.length}');
    print('next: ${context.watch<ListCounter>().isNextExist}');
    if (context.watch<ListCounter>().isNextExist && films.length == 10) {
      return GridView.builder(
        controller: _controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: films.length + 1,
        itemBuilder: (context, index) {
          if (films.length == 0) {
            context.read<FilmsListCounter>().increment();
          }
          if (films.length == index && films.length % 10 == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.purple,
                child: Text(
                  films[index].title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
        },
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: films.length + 1,
              itemBuilder: (context, index) {
                if (films.length == 0) {
                  context.read<FilmsListCounter>().increment();
                }
                if (films.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.black,
                      child: Text(
                        films[index].title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      );
    }
  }
}
