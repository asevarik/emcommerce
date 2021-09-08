import 'dart:ui';

import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  // static ThemeData themeData(bool isDarkTheme, BuildContext context) {
  //   return ThemeData(
  //     scaffoldBackgroundColor:
  //         isDarkTheme ? Colors.black : Colors.grey.shade300,
  //     primarySwatch: Colors.purple,
  //     primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
  //     accentColor: Colors.deepPurple,
  //     backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
  //     indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
  //     buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
  //     hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
  //     highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
  //     hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
  //     focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
  //     disabledColor: Colors.grey,
  //     textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
  //     cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
  //     canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
  //     brightness: isDarkTheme ? Brightness.dark : Brightness.light,
  //     buttonTheme: Theme.of(context).buttonTheme.copyWith(
  //         colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
  //     appBarTheme: AppBarTheme(
  //       elevation: 0.0,
  //     ),
  //   );
  // }

  static List<ThemeData> colorThemes() {
    return [
      //!Theme-0 Dark THeme Don't Change it unless it is required
      ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: DarkThemeColors.darkgreen),
        scaffoldBackgroundColor: DarkThemeColors.black,
        primarySwatch: MaterialColor(
          0xff05d348, //Light Blue Shade
          <int, Color>{
            50: DarkThemeColors.lightgreen,
            100: DarkThemeColors.lightgreen,
            200: DarkThemeColors.lightgreen,
            300: DarkThemeColors.lightgreen,
            400: DarkThemeColors.lightgreen,
            500: DarkThemeColors.lightgreen,
            600: DarkThemeColors.lightgreen,
            700: DarkThemeColors.lightgreen,
            800: DarkThemeColors.lightgreen,
            900: DarkThemeColors.lightgreen,
          },
        ),
        primaryColorLight: Colors.white24,
        primaryColor: DarkThemeColors.black,
        accentColor: DarkThemeColors.darkgreen,
        hoverColor: DarkThemeColors.darkgreen,
        backgroundColor: DarkThemeColors.black,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
          headline4: TextStyle(color: Colors.white70, fontSize: 13),
          headline6: TextStyle(color: Colors.white, fontSize: 16),
        ),

        //!below are the styles specific to widgets inbuilt

        //*Elevated Button Style Theme Globally Enabled
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        //?Bottom AppBar Styles
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: DarkThemeColors.darkgreen,
          selectedIconTheme: IconThemeData(color: DarkThemeColors.lightgreen),
        ),

        //! floating action button style
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: DarkThemeColors.darkgreen),
        //? Icon
        iconTheme: IconThemeData(color: Colors.white),
      ),

      //!THeme-1
      ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Theme1Colors.darkpurple),
        scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: MaterialColor(
          0xFFCE93D8, //Light purple
          <int, Color>{
            50: Theme1Colors.lightpurple,
            100: Theme1Colors.lightpurple,
            200: Theme1Colors.lightpurple,
            300: Theme1Colors.lightpurple,
            400: Theme1Colors.lightpurple,
            500: Theme1Colors.lightpurple,
            600: Theme1Colors.lightpurple,
            700: Theme1Colors.lightpurple,
            800: Theme1Colors.lightpurple,
            900: Theme1Colors.lightpurple,
          },
        ),
        primaryColor: Colors.grey.shade300,
        primaryColorLight: Colors.white,
        accentColor: Theme1Colors.lightpurple,
        backgroundColor: Colors.white,
        indicatorColor: Theme1Colors.lightpurple,
        hoverColor: Theme1Colors.darkpurple,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
          headline4: TextStyle(color: Colors.black54, fontSize: 13),
          headline6: TextStyle(color: Colors.black, fontSize: 16),
        ),

        //!below are the styles specific to widgets inbuilt

        //*Elevated Button Style Theme Globally Enabled
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        //?Bottom AppBar Styles
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Theme1Colors.lightpurple,
          selectedIconTheme: IconThemeData(color: Theme1Colors.darkpurple),
        ),

        //! floating action button style
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Theme1Colors.lightpurple),
        //? Icon
        iconTheme: IconThemeData(color: Colors.black54),
      ),

      //!!END OF THEME 1 OF the APP Below is the App Theme 2 Which Will Be dynamic in nature!!!!///

      //!Theme-2//
      ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: theme2colors.lightblueshade),
          scaffoldBackgroundColor: Colors.grey.shade300,
          primarySwatch: MaterialColor(
            0xff98c1d9, //Light Blue Shade
            <int, Color>{
              50: theme2colors.lightblueshade,
              100: theme2colors.lightblueshade,
              200: theme2colors.lightblueshade,
              300: theme2colors.lightblueshade,
              400: theme2colors.lightblueshade,
              500: theme2colors.lightblueshade,
              600: theme2colors.lightblueshade,
              700: theme2colors.lightblueshade,
              800: theme2colors.lightblueshade,
              900: theme2colors.lightblueshade,
            },
          ),
          primaryColor: Colors.grey.shade300,
          primaryColorLight: Colors.white,
          accentColor: Color(0xff98c1d9),
          backgroundColor: Colors.white,
          indicatorColor: Color(0xffCBDCF8),
          hoverColor: Color(0xff3d5a80),
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            headline3: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal),
            headline4: TextStyle(color: Colors.black54, fontSize: 13),
            headline6: TextStyle(color: Colors.black, fontSize: 16),
          ),

          //!below are the styles specific to widgets inbuilt

          //*Elevated Button Style Theme Globally Enabled
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          //?Bottom AppBar Styles
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: theme2colors.lightblueshade,
            selectedIconTheme: IconThemeData(color: theme2colors.darkblue),
          ),

          //! floating action button style
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: theme2colors.lightblueshade),
          //? Icon
          iconTheme: IconThemeData(color: Colors.black54)),

      //!END of THEME-2 Of the APP Below is the THEME -3 of app///////

      //!Theme-3
      ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: theme3Colors.lightgreenshade),
          scaffoldBackgroundColor: Colors.grey.shade300,
          primarySwatch: MaterialColor(
            0xff56c596, //Light Blue Shade
            <int, Color>{
              50: theme3Colors.lightgreenshade,
              100: theme3Colors.lightgreenshade,
              200: theme3Colors.lightgreenshade,
              300: theme3Colors.lightgreenshade,
              400: theme3Colors.lightgreenshade,
              500: theme3Colors.lightgreenshade,
              600: theme3Colors.lightgreenshade,
              700: theme3Colors.lightgreenshade,
              800: theme3Colors.lightgreenshade,
              900: theme3Colors.lightgreenshade,
            },
          ),
          primaryColor: Colors.grey.shade300,
          primaryColorLight: Colors.white,
          accentColor: theme3Colors.lightgreenshade,
          backgroundColor: Colors.white,
          indicatorColor: theme3Colors.lightgreenshade,
          hoverColor: theme3Colors.darkgreen,
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            headline3: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal),
            headline4: TextStyle(color: Colors.black54, fontSize: 13),
            headline6: TextStyle(color: Colors.black, fontSize: 16),
          ),

          //!below are the styles specific to widgets inbuilt

          //*Elevated Button Style Theme Globally Enabled
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          //?Bottom AppBar Styles
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: theme3Colors.lightgreenshade,
            selectedIconTheme: IconThemeData(color: theme3Colors.darkgreen),
          ),

          //! floating action button style
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: theme3Colors.lightgreenshade),
          //? Icon
          iconTheme: IconThemeData(color: Colors.black54)),
    ];
  }
}
