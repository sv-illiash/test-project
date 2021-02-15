import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {
  static bool get isDark => Get.theme.brightness == Brightness.dark;

  static const MaterialColor primaryColor = MaterialColor(0xFFFFC491, {
    100: primary,
    200: primary,
  });

  static const Color primary = Color(0xFFFFC491);
  static const Color black = Color(0xFF1C2026);
  static final Color gray3 = Color(0xFF828282);
  static final Color red = Color(0xFFFF594F);
  static final Color textFieldBorder = Color(0xFFE8E9E9);
}
