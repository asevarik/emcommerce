import 'package:ECommerceApp/Common_utils/Consts/theme_data.dart';
import 'package:ECommerceApp/Common_utils/provider/Dark_Theme_provider.dart';
import 'package:ECommerceApp/Common_utils/provider/Products.dart';
import 'package:ECommerceApp/screens/Wishlist.dart';
import 'package:ECommerceApp/screens/auth/Signup.dart';
import 'package:ECommerceApp/screens/bottom_bar.dart';
import 'package:ECommerceApp/screens/cart.dart';
import 'package:ECommerceApp/screens/feed.dart';
import 'package:ECommerceApp/screens/inner_screens/Categories_FeedScreen.dart';
import 'package:ECommerceApp/screens/inner_screens/brands_navigation_rail%20copy.dart';
import 'package:ECommerceApp/screens/landing_page.dart';
import 'package:ECommerceApp/screens/auth/login.dart';
import 'package:ECommerceApp/screens/product_details.dart';
import 'package:ECommerceApp/screens/search.dart';
import 'package:ECommerceApp/screens/themeSelectionscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:get/get.dart';

import 'Common_utils/provider/FavProvider.dart';
import 'Common_utils/provider/cart_provider.dart';

Future main() async {
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return MultiProvider(
        providers: [
          //!Providers goes here
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FavProvider()),
        ],
        builder: (context, snapshot) {
          return ThemeBuilder(
              themes: Styles.colorThemes(),
              builder: (context, regularTheme, darkTheme, themeMode) {
                return MaterialApp(
                  theme: regularTheme,
                  darkTheme: darkTheme,
                  themeMode: themeMode,
                  title: 'HopClues',
                  initialRoute: LandingPage.routeName,
                  routes: {
                    SignUpPage.routeName:(context)=>SignUpPage(),
                    LoginPage.routeName: (context) => LoginPage(),
                    LandingPage.routeName: (context) => LandingPage(),
                    BottomBarScreen.screenname: (context) => BottomBarScreen(),
                    BrandNavigationRailScreen.routeName: (context) =>
                        BrandNavigationRailScreen(),
                    FeedPage.Routename: (context) => FeedPage(),
                    CartPage.RouteName: (context) => CartPage(),
                    WishListPage.RouteName: (context) => WishListPage(),
                    ThemeSelectorScreen.screename: (context) =>
                        ThemeSelectorScreen(),
                    CategoryFeedPage.routeName: (context) => CategoryFeedPage(),
                    Product_Details.routeName: (context) => Product_Details(),
                    Search.routeName: (context) => Search(),
                    BottomBarScreen.screenname:(context)=>BottomBarScreen(),
                    
                  },
                  home: LandingPage(),
                );
              });
        });
  }
}
