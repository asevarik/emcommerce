import 'package:ECommerceApp/Common_utils/Shared_prefs/dark_Theme_prefs.dart';
import 'package:get/get.dart';
// class DarkThemeProviders with ChangeNotifier {
//   DarkThemePreferences darkThemePreferences = DarkThemePreferences();
//   bool kdarkTheme = false;
//   bool get darkTheme => kdarkTheme;
//   set darkTheme(bool value) {
//     kdarkTheme = value;
//     darkThemePreferences.setDarkTheme(value);
//     notifyListeners();
//   }
// }

class ThemeController extends GetxController {
  var selectedTheme = 1.obs;
  var isDark = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentTheme();
  }

  //initially setting the value
  void getCurrentTheme() async {
    DarkThemePreferences darkThemePreferences = DarkThemePreferences();
    var tempisDark = await darkThemePreferences.getIsDark();
    var tempselectedTheme = await darkThemePreferences.getSelectedThemeIndex();
    isDark = RxBool(tempisDark);
    selectedTheme = RxInt(tempselectedTheme);
  }

  void setdarkmode(bool value) {
    DarkThemePreferences darkThemePreferences = DarkThemePreferences();
    isDark = RxBool(value);
    darkThemePreferences.setDarkTheme(value, selectedTheme.toInt());
  }

  void themechange(int index) {
    DarkThemePreferences darkThemePreferences = DarkThemePreferences();
    selectedTheme = RxInt(index);
    darkThemePreferences.setDarkTheme(isDark.value, index);
  }
}
