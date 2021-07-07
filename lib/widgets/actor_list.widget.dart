import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kino_actor/colors.dart';
import 'package:kino_actor/view_models/actor_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:kino_actor/widgets/details/film_details.widget.dart';
import 'package:kino_actor/widgets/details/actor_details.widget.dart';

class ActorList extends StatefulWidget {
  final ActorListViewModel vm;

  ActorList({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  _ActorListState createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  late Timer _debounce;
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 50.0);
  late TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {},
    );
    _textController = TextEditingController();
    _controller.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.vm.allPeople.isEmpty) {
      widget.vm.getSearchedPeopleNextPage(_textController.text);
    }
  }

  @override
  void dispose() {
    _debounce.cancel();
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      if (widget.vm.doesNextExist) {
        widget.vm.getSearchedPeopleNextPage(_textController.text);
      }
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.vm.cleanAllPeopleList();
      widget.vm.getSearchedPeopleNextPage(_textController.text);
    });
  }

  Widget pageListFunction(BuildContext context, int index) {
    if (_controller.hasClients) {
      if (widget.vm.allPeople.length == index) {
        if (widget.vm.doesNextExist) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Expanded(
            child: Center(
              child: Text('No more data'),
            ),
          );
        }
      } else
        return AppCard(
          items: [
            AppCardItem(
              item: widget.vm.allPeople[index].name,
              textFontSize: 20,
            ),
          ],
        );
    } else {
      widget.vm.getSearchedPeopleNextPage(_textController.text);
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 70, 10, 0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colours.whiteColor,
              borderRadius: new BorderRadius.circular(50),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Search characters",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: _onSearchChanged,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      widget.vm.cleanAllPeopleList();

                      widget.vm.getSearchedPeopleNextPage(_textController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
            addRepaintBoundaries: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4,
            ),
            controller: _controller,
            itemCount: widget.vm.allPeople.length + 1,
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colours.blackColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colours.whiteColor)),
                child: pageListFunction(context, index),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActorDetails(
                        actor: widget.vm.allPeople[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
