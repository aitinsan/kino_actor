import 'package:flutter/material.dart';
import 'package:kino_actor/models/actors_list_counter.dart';
import 'package:kino_actor/models/people.dart';
import 'package:provider/provider.dart';

class PeopleList extends StatefulWidget {
  PeopleList({Key? key}) : super(key: key);

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
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
    List<People> peoples = context.watch<ActorsListCounter>().allPeople;
    if (context.watch<ActorsListCounter>().isNextExist) {
      return GridView.builder(
        controller: _controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: peoples.length + 1,
        itemBuilder: (context, index) {
          if (peoples.length == 0) {
            context.read<ActorsListCounter>().increment();
          }
          print(context.watch<ActorsListCounter>().isNextExist);
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
      );
    } else {
      return Column(
        children: [
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
                print(context.watch<ActorsListCounter>().isNextExist);
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
          Text("No more data")
        ],
      );
    }
  }
}
