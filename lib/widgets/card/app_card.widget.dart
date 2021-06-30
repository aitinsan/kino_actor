import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kino_actor/colors.dart';
import 'package:kino_actor/models/app_card.model.dart';

class AppCard extends StatelessWidget {
  final List<AppCardItem>? items;
  AppCard({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Card(
        elevation: 4,
        color: Colours.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child:  ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items!.length,
              itemBuilder: (context, index) {
                return Container(
                  //color: Colours.blackColor,
                  child: Text(
                    items![index].item.toString(),
                    style: TextStyle(
                      color: Colours.whiteColor,
                    ),
                  ),
                );
              }),
        ),
      
    );
  }
}