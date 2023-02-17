import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppTheme {
  static List<Color> mainColors = [rgb(109, 132, 239)];
  static List<Color> secondaryColors = [rgb(35, 34, 58)];
  static List<Color> fontColors = [
    rgb(35, 35, 46),
    rgb(245, 245, 255),
    rgb(37, 47, 107)
  ];
  static List<Color> bgColors = [
    Colors.white,
    rgb(24, 34, 61),
    rgb(245, 245, 255)
  ];

  static int index = 0;
}

Color get mainColor => AppTheme.index >= AppTheme.mainColors.length
    ? Colors.white
    : AppTheme.mainColors[AppTheme.index];

Color get secondaryColor => AppTheme.index >= AppTheme.secondaryColors.length
    ? Colors.white
    : AppTheme.secondaryColors[AppTheme.index];

Color get fontColor => AppTheme.index >= AppTheme.fontColors.length
    ? Colors.black
    : AppTheme.fontColors[AppTheme.index];

Color get bgColor => AppTheme.index >= AppTheme.bgColors.length
    ? Colors.white
    : AppTheme.bgColors[AppTheme.index];

Color rgb(r, g, b) {
  return Color.fromRGBO(r, g, b, 1);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

extension Cl on Color {
  Color shade(int s) {
    var r = s < 0 ? max(0, red + s) : min(255, red + s);
    var g = s < 0 ? max(0, green + s) : min(255, green + s);
    var b = s < 0 ? max(0, blue + s) : min(255, blue + s);
    return withRed(r).withGreen(g).withBlue(b);
  }
}

extension Wl on Widget {
  Animate defanim(int delay) {
    return animate()
        .fade(begin: 0, end: 1, duration: 400.ms, delay: (delay * 200).ms)
        .slideX(begin: 1, end: 0, duration: 200.ms, delay: (delay * 200).ms);
  }
}
