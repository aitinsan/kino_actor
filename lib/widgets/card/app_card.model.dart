import 'dart:ui';

import 'package:kino_actor/lightTheme.dart';

class AppCardItem {
  String title;
  int textFontSize;
  String? subTitle;
  Color? colour = AppTheme.lightTheme.cardColor;
  AppCardItem({
    required this.title,
    required this.textFontSize,
    this.colour,
    this.subTitle = '',
  });
}
