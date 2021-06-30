// import 'package:flutter/material.dart';
// import 'package:kino_actor/colors.dart';
// import 'package:kino_actor/models/films_list_search.model.dart';
// import 'package:kino_actor/widgets/films_searched_items.widget.dart';
// import 'package:provider/provider.dart';

// class FilmsSearchedScreen extends StatelessWidget {
//   const FilmsSearchedScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Provider.of<FilmsListSearch>(context, listen: false)
//                     .cleanFilms();
//                 Navigator.pop(context);
//               },
//             );
//           },
//         ),
//         //backwardsCompatibility: false,
//         title: Text('Searched Films'),
//         backgroundColor: Colours.blackColor,
//       ),
//       body: FilmsSearchedItems(),
//     );
//   }
// }
