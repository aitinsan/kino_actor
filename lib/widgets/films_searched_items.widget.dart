import 'package:flutter/material.dart';
import 'package:kino_actor/models/app_card.model.dart';
import 'package:kino_actor/models/films.model.dart';
import 'package:kino_actor/models/films_list_search.model.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
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
    return Column(
      children: [
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
              child: Text(
                'Search Starwars Movies: ' + context.read<FilmsListSearch>().keyword,
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
            controller: _controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3,
            ),
            itemCount: films.length + 1,
            itemBuilder: (context, index) {
              if (context.watch<FilmsListSearch>().isNextExist &&
                  films.length == 10) {
                if (films.length == 0) {
                  context.read<FilmsListSearch>().increment();
                }

                if (films.length == index) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return AppCard(items: [
                    AppCardItem(
                      films[index].title,
                      20
                    ),
                    AppCardItem(
                      films[index].episodeId.toString(),
                      22
                    ),
                  ]);
                }
              } else {
                if (films.length == 0) {
                  context.read<FilmsListSearch>().increment();
                }
                if (films.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return AppCard(items: [
                    AppCardItem(
                      films[index].title,
                      20
                    ),
                    AppCardItem(
                      films[index].episodeId.toString(),
                      22
                    ),
                  ]);
              }
            },
          ),
        ),
      ],
    );
  }
}
    /*if (context.watch<FilmsListSearch>().isNextExist && films.length == 10) {
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
*/