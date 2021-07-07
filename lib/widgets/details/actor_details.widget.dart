import 'package:flutter/material.dart';
import 'package:kino_actor/lightTheme.dart';
import 'package:kino_actor/models/actor.model.dart';
import 'package:kino_actor/widgets/details/deteils_row.dart';
import 'package:kino_actor/widgets/divider.dart';

class ActorDetails extends StatelessWidget {
  Actor actor;
  ActorDetails({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.lightTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          actor.name,
          style: TextStyle(color: AppTheme.lightTheme.primaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 50),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          borderOnForeground: false,
          color: AppTheme.lightTheme.cardColor,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailsRow(
                  titleOfItem: 'Name',
                  item: '${actor.name}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Birth year',
                  item: '${actor.birthYear}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Created',
                  item:
                      '${actor.created.day}/${actor.created.month}/${actor.created.year}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Edited',
                  item:
                      '${actor.edited.day}/${actor.edited.month}/${actor.edited.year}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Eye color',
                  item: '${actor.eyeColor}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Gender',
                  item: '${actor.gender}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Hair color',
                  item: '${actor.hairColor}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Heigth',
                  item: '${actor.heigth}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Mass',
                  item: '${actor.mass}',
                ),
                divider,
                DetailsRow(
                  titleOfItem: 'Skin color',
                  item: '${actor.skinColor}',
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
