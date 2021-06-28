import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/models/people.dart';
import 'package:kino_actor/repository/backend.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/screens/people_list.dart';
import 'package:provider/provider.dart';
//todo сделать нормальная архитекуту(репозиторий виджеты) сделать функцую кторая расширает лист и выводит его через листвью

class ActorsPage extends StatefulWidget {
  ActorsPage({Key? key}) : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  /*int pageIndex =1;
  Future<void> _changePageIndex() async{
    setState(() {
      pageIndex++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget> [
      Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Films",
                hintStyle: TextStyle(
                  color: Colors.black.withAlpha(120),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {},
            ),
          )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                Icons.search,
                color: Colors.black.withAlpha(120),
              ))
        ],
      ),

      
      Expanded(child:PeopleList(peoples: context.watch<ActorsListCounter>().allPeople)),
      

      TextButton(
          onPressed: () => context.read<ActorsListCounter>().increment(),
          child: Text("${context.watch<ActorsListCounter>().pageIndex}")),





      //Expanded(child: ListView.builder(padding: const EdgeInsets.all(8),itemBuilder: itemBuilder))
      //это нужно изменить на листвью
      /*FutureBuilder<List<People>>(
        future: fetchPeople(http.Client(), pageIndex),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return PeopleList(peoples: snapshot.data!);
        },
      ),
      TextButton(
        onPressed: () {
          _changePageIndex();
        },
        child: Text("changeIndex"),
      ),*/
    ]);
  }
}

class ActorsPageNumber extends StatelessWidget {
  const ActorsPageNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
