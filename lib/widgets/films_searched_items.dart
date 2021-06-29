import 'package:flutter/material.dart';
import 'package:kino_actor/models/films.dart';
import 'package:kino_actor/models/films_list_search.dart';
import 'package:provider/provider.dart';

class FilmsSearchedItems extends StatefulWidget {
  FilmsSearchedItems({Key? key}) : super(key: key);

  @override
  _FilmsSearchedItemsState createState() => _FilmsSearchedItemsState();
}

class _FilmsSearchedItemsState extends State<FilmsSearchedItems> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      context.read<FilmsListSearch>().increment();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Films> films = context.watch<FilmsListSearch>().allFilms;
    print('this is the film length $films.length');
    if (context.watch<FilmsListSearch>().isNextExist && films.length == 10) {
      return GridView.builder(
        controller: _controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: films.length + 1,
        itemBuilder: (context, index) {
          if (films.length == 0) {
            context.read<FilmsListSearch>().increment();
          }

          if (films.length == index )  {

            return Center(
              child: CircularProgressIndicator(),
            );
          } else{
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.blueAccent,
                child: Text(
                  films[index].title,
                ),
              ),
            );}
        },
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: films.length + 1,
              itemBuilder: (context, index) {
                if (films.length == 0) {
                  context.read<FilmsListSearch>().increment();
                }
                if (films.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.green,
                      child: Text(
                        films[index].title,
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
