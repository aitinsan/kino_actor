import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kino_actor/lightTheme.dart';
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: AppTheme.lightTheme.primaryColor),
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  overlayColor:
                      MaterialStateProperty.all<Color>(AppTheme.lightTheme.scaffoldBackgroundColor),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.lightTheme.cardColor)),
              child: AppCard(
                items: [
                  AppCardItem(
                    title: widget.vm.allFilms[index].title,
                    textFontSize: 18,
                    colour: AppTheme.lightTheme.primaryColor,
                    subTitle: widget.vm.allFilms[index].releaseDate,
                  ),
                ],
              ),
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
            ),
          ),
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
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppTheme.lightTheme.scaffoldBackgroundColor.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AppTheme.lightTheme.cardColor,
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
                          color: AppTheme.lightTheme.primaryColor,
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
                      color: AppTheme.lightTheme.primaryColor,
                    ),
                    onPressed: () {
                      widget.vm.cleanFilmList();

                      widget.vm.getSearchedFilmsNextPage(_textController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4.5,
            ),
            controller: _controller,
            itemCount: widget.vm.allFilms.length + 1,
            itemBuilder: (context, index) {
              return pageListFunction(context, index);
            },
          ),
        ),
      ],
    );
  }
}
