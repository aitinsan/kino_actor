import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/lightTheme.dart';
import 'package:kino_actor/view_models/actor_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:flutter/foundation.dart';
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
      ScrollController(initialScrollOffset: 0.0);
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
          return Center(
            child: Text('No more data'),
          );
        }
      } else
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: Material(
            elevation: 0,
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActorDetails(
                      actor: widget.vm.allPeople[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: AppCard(
                  items: [
                    AppCardItem(
                      title: widget.vm.allPeople[index].name,
                      textFontSize: 18,
                      colour: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).scaffoldBackgroundColor
                      .withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Theme.of(context).cardColor,
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
                          color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
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
        Expanded(
          flex: 1,
          child: ListView.builder(
            controller: _controller,
            itemCount: widget.vm.allPeople.length + 1,
            itemBuilder: (context, index) {
              return pageListFunction(context, index);
            },
          ),
        ),
      ],
    );
  }
}
