import 'package:flutter/material.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/check_box_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/chip_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/text_field_theme.dart';
import 'package:phone_auth_app/utils/theme/custom_theme/text_theme.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetThemeData,
    checkboxTheme: MyCheckBoxTheme.lightCheckboxThemeData,
    chipTheme: MyChipTheme.lightChipTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonThemeData,
    inputDecorationTheme: MyTextFieldTheme.darkInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFF222831),
    // scaffold color
    textTheme: MyTextTheme.darkTextTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetThemeData,
    checkboxTheme: MyCheckBoxTheme.darkCheckboxThemeData,
    chipTheme: MyChipTheme.darkChipTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonThemeData,
    inputDecorationTheme: MyTextFieldTheme.darkInputDecorationTheme,
  );
}
