import 'package:flutter/material.dart';

class Helpers {
  static Color isItDark(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.white : Colors.black;
    return color;
  }

  static Color forBottomNav(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.black38 : Colors.white;
    return color;
  }

  static Color forText(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.white70 : Colors.black;
    return color;
  }

  static Color forProductCard(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.light;
    final color = isDarkMode ? const Color(0xffFFFFE0) : Colors.white;
    return color;
  }
}
