import 'package:flutter/material.dart';
import 'package:kino_actor/colors.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';

class AppCard extends StatelessWidget {
  final List<AppCardItem>? items;
  AppCard({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 2,
        color: Colours.whiteColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text(
                    items![index].item.toString(),
                    style: TextStyle(
                      color: Colours.blackColor,
                      fontSize: items![index].textFontSize.toDouble(),
                    ),
                  ),
                );
              }),
        ),
      
    );
  }
}
