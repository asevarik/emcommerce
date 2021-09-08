import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";
  static const THEME_SELECTED_INDEX = "SELECTEDTHEME";
  setDarkTheme(bool value, int selectedindex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
    prefs.setInt(THEME_SELECTED_INDEX, selectedindex);
  }

  Future<bool> getIsDark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
          THEME_STATUS,
        ) ??
        false;
  }

  Future<int> getSelectedThemeIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(
          THEME_SELECTED_INDEX,
        ) ??
        2;
  }
}
