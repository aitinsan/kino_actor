import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors_list_counter.model.dart';
import 'package:kino_actor/models/list_counter.model.dart';
import 'package:kino_actor/models/actors.model.dart';
import 'package:provider/provider.dart';

class ActorsList extends StatefulWidget {
  ActorsList({Key? key}) : super(key: key);

  @override
  _ActorsListState createState() => _ActorsListState();
}

class _ActorsListState extends State<ActorsList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      context.read<ActorsListCounter>().increment();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Actors> peoples = context.watch<ActorsListCounter>().allPeople;
    return Column(
      children: [
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
              child: Text(
                'All Starwars Characters:',
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
              crossAxisCount: 2,
            ),
            itemCount: peoples.length + 1,
            itemBuilder: (context, index) {
              if (context.watch<ListCounter>().isNextExist &&
                  peoples.length % 10 == 0) {
                if (peoples.length == 0) {
                  context.read<ActorsListCounter>().increment();
                }
                if (peoples.length == index) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.amber,
                      child: Text(
                        peoples[index].name,
                      ),
                    ),
                  );
              } else {
                if (peoples.length == 0) {
                  context.read<ActorsListCounter>().increment();
                }
                if (peoples.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.amber,
                      child: Text(
                        peoples[index].name,
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
    /*if (context.watch<ListCounter>().isNextExist && peoples.length % 10 == 0) {
      return Column(
        children: [
          Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
                child: Text(
                  'All Starwars Characters:',
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
                crossAxisCount: 2,
              ),
              itemCount: peoples.length + 1,
              itemBuilder: (context, index) {
                if (peoples.length == 0) {
                  context.read<ActorsListCounter>().increment();
                }
                if (peoples.length == index) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.amber,
                      child: Text(
                        peoples[index].name,
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
                child: Text(
                  'All Starwars movies:',
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: peoples.length + 1,
              itemBuilder: (context, index) {
                if (peoples.length == 0) {
                  context.read<ActorsListCounter>().increment();
                }
                if (peoples.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.amber,
                      child: Text(
                        peoples[index].name,
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
  