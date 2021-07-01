import 'package:flutter/material.dart';
import 'package:kino_actor/view_models/actor_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/models/actor.model.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:provider/provider.dart';

class ActorList extends StatefulWidget {
  ActorList({Key? key}) : super(key: key);
  
  @override
  _ActorListState createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  final ScrollController _controller = ScrollController();
  
  @override
  void initState() {
    
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      context.read<ActorListViewModel>().getNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ActorListViewModel watchContext = context.watch<ActorListViewModel>();
    final ActorListViewModel readContext = context.read<ActorListViewModel>();
    final List<Actor> peoples = watchContext.allPeople;
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
              childAspectRatio: 1,
            ),
            itemCount: peoples.length + 1,
            itemBuilder: (context, index) {
              if (watchContext.doesNextExist && peoples.length % 10 == 0) {
                if (peoples.length == 0) {
                  readContext.getNextPage();
                }
                if (peoples.length == index) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return AppCard(items: [
                    AppCardItem(peoples[index].name, 20),
                  ]);
              } else {
                if (peoples.length == 0) {
                  readContext.getNextPage();
                }
                if (peoples.length == index) {
                  return Center(
                    child: Text('No more data'),
                  );
                } else
                  return AppCard(items: [
                    AppCardItem(peoples[index].name, 20),
                  ]);
              }
            },
          ),
        ),
      ],
    );
  }
}
