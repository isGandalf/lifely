import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';

OutlineInputBorder border = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 2),
);

OutlineInputBorder focusBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(color: AppColors.primaryAppColor, width: 2),
);

OutlineInputBorder errorBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(color: AppColors.errorColor, width: 2),
);

TextStyle hintTextStyle = TextStyle(color: AppColors.hintTextColor);

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  inputDecorationTheme: InputDecorationTheme(
    border: border,
    enabledBorder: border,
    focusedBorder: focusBorder,
    errorBorder: errorBorder,
    hintStyle: hintTextStyle,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryAppColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
);
