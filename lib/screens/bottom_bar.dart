import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/Dark_Theme_provider.dart';
import 'package:ECommerceApp/Models/user.dart';
import 'package:ECommerceApp/screens/cart/cart.dart';
import 'package:ECommerceApp/screens/feed.dart';
import 'package:ECommerceApp/screens/home.dart';
import 'package:ECommerceApp/screens/search.dart';
import 'package:ECommerceApp/screens/user_info.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  static final String routeName = "BottombarScreen";
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int selected_index;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': HomePage(),
        'title': 'HomeScreen',
      },
      {
        'page': FeedPage(),
        'title': 'FeedScreen',
      },
      {
        'page': Search(),
        'title': 'SearchScreen',
      },
      {
        'page': CartPage(),
        'title': 'CartScreen',
      },
      {
        'page': UserInfo(),
        'title': 'UserInfoScreen',
      },
    ];
    selected_index = 0;
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Future.delayed(Duration(milliseconds: 40)).then((value) {
              print("bottomBar inside");
              // return setState(() {});
            }));
  }

  void _selected_Page(int index) {
    setState(() {
      selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(_pages[selected_index]['title']),
      // ),
      body: _pages[selected_index]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            color: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme
                .color,
          ),
          Icon(
            Icons.rss_feed,
            color: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme
                .color,
          ),
          Icon(Icons.search,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .selectedIconTheme
                  .color,
              size: 40),
          Icon(
            Icons.shopping_cart,
            color: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme
                .color,
          ),
          Icon(
            Icons.person,
            color: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme
                .color,
          ),
        ],
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        color: Theme.of(context).backgroundColor,
        onTap: (int index) => _selected_Page(index),
        animationDuration: Duration(milliseconds: 200),
      ),
    );
  }
}
