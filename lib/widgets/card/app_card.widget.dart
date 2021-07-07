import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/lightTheme.dart';
import 'package:kino_actor/widgets/card/app_card.model.dart';

class AppCard extends StatelessWidget {
  final List<AppCardItem>? items;
  AppCard({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      autofocus: true,
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        items![index].title.toString(),
                        style: TextStyle(
                          color: items![index].colour,
                          fontSize: items![index].textFontSize.toDouble(),
                        ),
                      ),
                      subtitle: Text(
                        items![index].subTitle.toString(),
                        style: TextStyle(
                          color: AppTheme.lightTheme.scaffoldBackgroundColor,
                          fontSize: items![index].textFontSize.toDouble() - 4,
                        ),
                      ),
                    
                  );
                },
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppTheme.lightTheme.primaryColor,
        ),
      ],
    );
  }
}
