import 'package:flutter/material.dart';



class AppThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  AppThemeNotifier(this._themeData);

  getTheme() => _themeData;

  
}

class AppTheme {


  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey,
    primaryColor: Colors.black,
    cardColor: Colors.white,
    
  );
 
}