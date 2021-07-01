import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/view_models/actor_list.viewmodel.dart';
import 'package:kino_actor/widgets/actor_list.widget.dart';
import 'package:provider/provider.dart';

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ChangeNotifierProvider<ActorListViewModel>(
            create: (context) => ActorListViewModel(),
            child: ActorList(),
          ),
        ),
      ],
    );
  }
}
