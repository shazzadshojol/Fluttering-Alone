import 'package:flutter/material.dart';

class MyCheckBoxTheme {
  static CheckboxThemeData lightCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      switch (states.contains(WidgetState.selected)) {
        case true:
          return Colors.white;
        case false:
          return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      switch (states.contains(WidgetState.selected)) {
        case true:
          return Colors.blue;
        case false:
          return Colors.transparent;
      }
    }),
  );

  static CheckboxThemeData darkCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      switch (states.contains(WidgetState.selected)) {
        case true:
          return Colors.white;
        case false:
          return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      switch (states.contains(WidgetState.selected)) {
        case true:
          return Colors.blue;
        case false:
          return Colors.transparent;
      }
    }),
  );
}
