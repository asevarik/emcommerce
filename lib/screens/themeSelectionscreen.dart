import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/Dark_Theme_provider.dart';
import 'package:ECommerceApp/Models/dynamicthememodal.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:get/get.dart';

class ThemeSelectorScreen extends StatelessWidget {
  static final String screename = "/ThemeSelectionscreen";
  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamicTheme =
        DynamicColorChangerProvider(context);
    final ThemeController themeStorage = Get.find();
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              dynamicTheme.dynamiccolorObj().starterColor,
              dynamicTheme.dynamiccolorObj().endColor
            ])),
          ),
          title: Text(
            "Select Theme",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: ListView.builder(
          itemCount: themes.length,
          itemBuilder: (context, index) {
            return Container(
                child: ListTile(
              leading: Icon(themes[index].icon),
              title: Text(
                themes[index].themetitle,
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                getThemeManager(context).selectThemeAtIndex(index + 1);
                // print(getThemeManager(context).selectedThemeIndex);
                themeStorage.themechange(index + 1);
              },
            ));
          },
        ));
  }
}
