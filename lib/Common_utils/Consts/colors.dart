import 'package:ECommerceApp/Models/colorConstsmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ColorsConsts {
  static BuildContext context;
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color title = Color(0xDD000000);
  static Color subTitle = Color(0x8A000000);
  static Color backgroundColor = Color(0xFFE0E0E0); //grey shade 300

  static Color favColor = Color(0xFFF44336); // red 500
  static Color favBadgeColor = Color(0xFFE57373); // red 300

  static Color cartColor = Color(0xFF5E35B1); //deep purple 600
  static Color cartBadgeColor = Color(0xFFBA68C8); //purple 300

  static Color gradiendFStart = Color(0xFFE040FB); //purpleaccent 100
  static Color gradiendFEnd = Color(0xFFE1BEE7); //purple 100
  static Color endColor = Color(0xFFCE93D8); //purple 200
  static Color purple300 = Color(0xFFBA68C8); //purple 300
  // Color gradiendLEnd = (getThemeManager(context).selectedThemeIndex == 0)
  //     ?  //purple 400
  //     : Colors.blue.shade400;
  // Color gradiendLStart = (getThemeManager(context).selectedThemeIndex == 0)
  //     ? Color(0xFFAA00FF)
  //     : Colors.lightBlue.shade800; //purpleaccent 700
  static Color starterColor = Color(0xFF8E24AA); //purple 600
  static Color purple800 = Color(0xFF6A1B9A);
}

class Theme1Colors {
  static Color darkpurple = Color(0xFF8E24AA);
  static Color lightpurple = Color(0xFFCE93D8);
}

class theme2colors {
  static Color darkblue = Color(0xff3d5a80);
  static Color lightblueshade = Color(0xff98c1d9);
}

class theme3Colors {
  static Color darkgreen = Color(0xff329d9c);
  static Color lightgreenshade = Color(0xff56c596);
}

class DarkThemeColors {
  static Color darkgreen = Color(0xff05A139);
  static Color lightgreen = Color(0xff05D348);
  static Color black = Color(0xff060606);
}

class DynamicColorChangerProvider {
  final BuildContext context;

  DynamicColorChangerProvider(this.context);
  DynamicColors dynamiccolorObj() {
    DynamicColors dynamicColors;
    switch (getThemeManager(context).selectedThemeIndex) {
      case 0:
        dynamicColors = DynamicColors(
            DarkThemeColors.darkgreen,
            DarkThemeColors.lightgreen,
            DarkThemeColors.darkgreen,
            DarkThemeColors.lightgreen);
        break;
      case 1:
        //!yet to impliment
        dynamicColors = DynamicColors(
          Theme1Colors.darkpurple,
          Theme1Colors.lightpurple,
          Theme1Colors.darkpurple,
          Theme1Colors.lightpurple,
        );

        break;
      case 2:
        dynamicColors = DynamicColors(
            theme2colors.darkblue,
            theme2colors.lightblueshade,
            theme2colors.darkblue,
            theme2colors.lightblueshade);
        break;
      case 3:
        dynamicColors = DynamicColors(
            theme3Colors.darkgreen,
            theme3Colors.lightgreenshade,
            theme3Colors.darkgreen,
            theme3Colors.lightgreenshade);
        break;
      default:
        dynamicColors = DynamicColors(Colors.lightBlue.shade800,
            Colors.blue.shade400, Colors.blue.shade600, Colors.blue.shade200);
    }
    return dynamicColors;
  }
}
