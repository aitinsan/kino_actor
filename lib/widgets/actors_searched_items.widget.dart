import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors.model.dart';
import 'package:kino_actor/models/actors_list_search.model.dart';
import 'package:kino_actor/models/app_card.model.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
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
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
            child: Text(
              'Searched Actors: ' +
                  context.read<ActorsListSearch>().keyword,
              style: TextStyle(fontSize: 20),
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
                childAspectRatio: 3
              ),
              itemCount: peoples.length + 1,
              itemBuilder: (context, index) {
                if (context.watch<ActorsListSearch>().isNextExist) {
                  if (peoples.length == 0) {
                    context.read<ActorsListSearch>().increment();
                  }

                  if (peoples.length == index) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return AppCard(items: [
                    AppCardItem(
                      peoples[index].name,
                      20
                    ),
                  ]);
                } else {
                  if (peoples.length == 0) {
                    context.read<ActorsListSearch>().increment();
                  }
                  //print(context.read<SearchedActorsListCounter>().keywordText);
                  if (peoples.length == index) {
                    return Center(
                      child: Text('No more data'),
                    );
                  } else
                    return AppCard(items: [
                    AppCardItem(
                      peoples[index].name,
                      20
                      
                    ),
                    AppCardItem(
                      peoples[index].gender,
                      16
                      
                    ),
                  ]);
                }
              }),
        ),
      ],
    );
  }
}
    /*if (context.watch<ActorsListSearch>().isNextExist) {
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
}*/
