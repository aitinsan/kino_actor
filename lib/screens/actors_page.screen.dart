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
  late String searchedActors;
  @override
  void initState() {
    searchedActors = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Characters',style: TextStyle(color: Colors.black,fontSize: 20),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ChangeNotifierProvider<ActorListViewModel>(
        create: (context) => ActorListViewModel(),
        child: Consumer<ActorListViewModel>(
          builder: (context, vm, _) => ActorList(
            vm: vm,
          ),
        ),
      ),
    );
  }
}
