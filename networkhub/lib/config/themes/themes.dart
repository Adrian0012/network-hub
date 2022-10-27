import 'package:flutter/material.dart';
import 'package:networkhub/config/themes/fonts.dart';
import 'package:networkhub/config/themes/palette.dart';

class Themes {
  static ThemeData primaryTheme = ThemeData(
    primaryColor: Palette.primaryColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Palette.accentColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Fonts.playBold,
    brightness: Brightness.light,
  );
}
