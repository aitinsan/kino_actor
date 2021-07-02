import 'package:flutter/material.dart';
import 'package:kino_actor/view_models/actor_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/models/actor.model.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:provider/provider.dart';

class ActorList extends StatefulWidget {
  final ActorListViewModel vm;
  ActorList({Key? key, required this.vm}) : super(key: key);

  @override
  _ActorListState createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  final ScrollController _controller = ScrollController(initialScrollOffset: 50.0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.vm.allPeople.isEmpty) {
      widget.vm.getNextPage();
    }
  }

  void _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      
    }
  }

  Widget pageListFunction(BuildContext context, int index) {
    if (widget.vm.allPeople.length == index) {
      if (widget.vm.doesNextExist) {
        widget.vm.getNextPage();
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Center(
          child: Text('No more data'),
        );
      }
    } else
      return AppCard(
        items: [
          AppCardItem(item: widget.vm.allPeople[index].name, textFontSize: 20),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
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
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount:
                  widget.vm.allPeople.length + 1, //peopleLength(context),
              itemBuilder: (context, index) {
                return Center(
                  child: pageListFunction(context, index),
                );
              },
            ),
          ),
        
      ],
    );
  }
}
