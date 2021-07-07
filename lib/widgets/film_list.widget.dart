import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kino_actor/colors.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/view_models/film_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:kino_actor/widgets/details/film_details.widget.dart';

class FilmsList extends StatefulWidget {
  final FilmListViewModel vm;
  FilmsList({Key? key, required this.vm}) : super(key: key);

  @override
  _FilmsListState createState() => _FilmsListState();
}

class _FilmsListState extends State<FilmsList> {
  late Timer _debounce;
  final ScrollController _controller = ScrollController();
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
    if (widget.vm.allFilms.isEmpty && _textController.text == '') {
      widget.vm.getSearchedFilmsNextPage(_textController.text);
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        widget.vm.cleanFilmList();
        widget.vm.getSearchedFilmsNextPage(_textController.text);
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      if (widget.vm.doesNextExist) {
        widget.vm.getSearchedFilmsNextPage(_textController.text);
      }
    }
  }

  Widget pageListFunction(BuildContext context, int index) {
    if (_controller.hasClients) {
      if (widget.vm.allFilms.length == index) {
        if (widget.vm.doesNextExist) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('No more films'),
          );
        }
      } else
        return AppCard(
          items: [
            AppCardItem(
                item: widget.vm.allFilms[index].title +
                    ' ' +
                    widget.vm.allFilms[index].episodeId.toString(),
                textFontSize: 20),
            AppCardItem(
                item: widget.vm.allFilms[index].releaseDate,
                textFontSize: 14,
                colour: Colors.grey),
          ],
        );
    } else {
      widget.vm.getSearchedFilmsNextPage(_textController.text);
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
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: "Search Films",
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
                        widget.vm.cleanFilmList();

                        widget.vm
                            .getSearchedFilmsNextPage(_textController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
              child: Text(
                'All Starwars Movies:',
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
              crossAxisCount: 1,
              childAspectRatio: 5,
            ),
            controller: _controller,
            itemCount: widget.vm.allFilms.length + 1,
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
                      builder: (context) => FilmDetails(
                        film: widget.vm.allFilms[index],
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
