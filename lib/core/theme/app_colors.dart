import 'package:flutter/material.dart';

class AppColors {
  static Color primaryAppColor = const Color.fromRGBO(82, 171, 253, 1);
  static Color scaffoldBackground = const Color.fromRGBO(243, 243, 247, 1);
  static Color errorColor = Colors.red.shade700;
  static Color hintTextColor = Colors.grey.shade400;
  static Color textFieldBorderColor = const Color.fromARGB(255, 226, 226, 226);
  static Color containerColorBlue2 = const Color.fromARGB(255, 196, 224, 252);
  static Color containerColorBlue1 = const Color.fromARGB(255, 228, 240, 248);
  static Color containerColorPink1 = const Color.fromARGB(255, 254, 240, 247);
  static Color containerColorPink2 = const Color.fromRGBO(251, 197, 197, 1);
  static Color containerColorOrange1 = const Color.fromARGB(255, 252, 242, 239);
  static Color containerColorOrange2 = const Color.fromARGB(255, 255, 207, 194);
  static Color containerColorGreen1 = const Color.fromARGB(255, 224, 250, 218);
  static Color containerColorGreen2 = const Color.fromARGB(255, 122, 238, 99);
  static Color containerColorYellow1 = const Color.fromRGBO(255, 241, 205, 1);
  static Color containerColorYellow2 = const Color.fromRGBO(238, 182, 99, 1);
}

class ColorPair {
  final Color fillColor;
  final Color borderColor;

  ColorPair({required this.fillColor, required this.borderColor});
}
