import 'package:flutter/material.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';
import 'package:kino_actor/models/film.model.dart';
import 'package:kino_actor/view_models/film_list.viewmodel.dart';
import 'package:kino_actor/widgets/card/app_card.widget.dart';
import 'package:provider/provider.dart';

class FilmsList extends StatefulWidget {
  final FilmListViewModel vm; 
  FilmsList({Key? key, required this.vm}) : super(key: key);

  @override
  _FilmsListState createState() => _FilmsListState();
}

class _FilmsListState extends State<FilmsList> {
  final ScrollController _controller = ScrollController();


  @override
  void initState() {
    
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.vm.allFilms.isEmpty) {
      widget.vm.getNextPage();
    }
  }

  void _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      widget.vm.getNextPage();
    }
  }
  Widget pageListFunction(BuildContext context, int index) {
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
          AppCardItem(item: widget.vm.allFilms[index].title, textFontSize: 20),
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
            scrollDirection: Axis.vertical,
            controller: _controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
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
