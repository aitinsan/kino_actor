import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors.model.dart';
import 'package:kino_actor/models/actors_list_search.model.dart';
import 'package:provider/provider.dart';

class ActorsSearchedItems extends StatefulWidget {
  ActorsSearchedItems({Key? key}) : super(key: key);

  @override
  _ActorsSearchedItemsState createState() => _ActorsSearchedItemsState();
}

class _ActorsSearchedItemsState extends State<ActorsSearchedItems> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      context.read<ActorsListSearch>().increment();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Actors> peoples = context.watch<ActorsListSearch>().allPeople;
    if (context.watch<ActorsListSearch>().isNextExist) {
      return GridView.builder(
        controller: _controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: peoples.length + 1,
        itemBuilder: (context, index) {
          if (peoples.length == 0) {
            context.read<ActorsListSearch>().increment();
          }

          if (peoples.length == index) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.blueAccent,
                child: Text(
                  peoples[index].name,
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
                crossAxisCount: 1,
              ),
              itemCount: peoples.length + 1,
              itemBuilder: (context, index) {
                if (peoples.length == 0) {
                  context.read<ActorsListSearch>().increment();
                }
                //print(context.read<SearchedActorsListCounter>().keywordText);
                if (peoples.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Text(
                        peoples[index].name,
                      ),
                    ),
                  );

                  /*return AppCard(
                    childrenf: [
                      AppCardRow('name', peoples[index].name),
                      AppCardRow('age', peoples[index].eyeColor),
                    ]
                  )
                  );*/
              },
            ),
          ),
        ],
      );
    }
  }
}
