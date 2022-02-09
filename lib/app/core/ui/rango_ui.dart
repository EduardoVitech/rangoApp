import 'package:flutter/material.dart';

class RangoUI {
  RangoUI._();

  static final ThemeData theme = ThemeData(
    primaryColor: Colors.purple,
    primaryColorDark: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.purple[300],
      selectedIconTheme: IconThemeData(color: Colors.purple[300]),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[200],
      unselectedIconTheme: IconThemeData(color: Colors.grey[200]),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
