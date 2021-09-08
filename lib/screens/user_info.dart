import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/Dark_Theme_provider.dart';
import 'package:ECommerceApp/screens/Wishlist.dart';
import 'package:ECommerceApp/screens/cart.dart';
import 'package:ECommerceApp/screens/themeSelectionscreen.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:toast/toast.dart';
import 'package:get/get.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool isDark = false;
  ScrollController _scrollController;
  var top = 0.0;
  List usertiledetails = [
    {
      'title': 'Email',
      'subtitle': 'Emailsub',
      'icon': Icons.email,
    },
    {
      'title': 'Phone',
      'subtitle': '1234567890',
      'icon': Icons.phone,
    },
    {
      'title': 'Shipping Address',
      'subtitle': '101 badshash',
      'icon': Icons.delivery_dining,
    },
    {'title': 'joned date', 'subtitle': 'date', 'icon': Icons.calendar_today},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamicTheme =
        DynamicColorChangerProvider(context);
    final ThemeController themeController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            dynamicTheme.dynamiccolorObj().starterColor,
                            dynamicTheme.dynamiccolorObj().endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: top <= 110.0 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 300),
                            child: Row(
                              children: [
                                SizedBox(width: SizeConfig.screenWidth / 21),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 1.0,
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              'https://www.pngitem.com/pimgs/m/35-350426_profile-icon-png-default-profile-picture-png-transparent.png'))),
                                ),
                                SizedBox(width: SizeConfig.screenWidth / 21),
                                Text(
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: SizeConfig.screenWidth / 20,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/35-350426_profile-icon-png-default-profile-picture-png-transparent.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth / 50),
                      child: usertitile('User Bag'),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        "Wishlist",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      leading: Icon(
                        Icons.favorite_border_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      trailing: Icon(Icons.chevron_right_rounded,
                          color: Theme.of(context).iconTheme.color),
                      onTap: () => Navigator.of(context)
                          .pushNamed(WishListPage.RouteName),
                    ),
                    ListTile(
                      title: Text(
                        "Cart",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      leading: Icon(Icons.shopping_cart_outlined,
                          color: Theme.of(context).iconTheme.color),
                      trailing: Icon(Icons.chevron_right_rounded,
                          color: Theme.of(context).iconTheme.color),
                      onTap: () {
                        Navigator.of(context).pushNamed(CartPage.RouteName);
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth / 50),
                      child: usertitile('User Information'),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userlistTile(
                        usertiledetails[0]['title'],
                        usertiledetails[0]['subtitle'],
                        usertiledetails[0]['icon'],
                        () {}),
                    userlistTile(
                        usertiledetails[1]['title'],
                        usertiledetails[1]['subtitle'],
                        usertiledetails[1]['icon'],
                        () {}),
                    userlistTile(
                        usertiledetails[2]['title'],
                        usertiledetails[2]['subtitle'],
                        usertiledetails[2]['icon'],
                        () {}),
                    userlistTile(
                        usertiledetails[3]['title'],
                        usertiledetails[3]['subtitle'],
                        usertiledetails[3]['icon'],
                        () {}),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth / 50),
                      child: usertitile('User Settings'),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    GetX<ThemeController>(builder: (themestorage) {
                      return ListTileSwitch(
                        value: themestorage.isDark.value,
                        leading: Icon(
                          Icons.nightlight_round_outlined,
                          size: SizeConfig.screenWidth / 14,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onChanged: (value) {
                          themestorage.setdarkmode(value);
                          (value)
                              ? getThemeManager(context).selectThemeAtIndex(0)
                              : getThemeManager(context).selectThemeAtIndex(
                                  themestorage.selectedTheme.value);
                          // print(
                          //     getThemeManager(context).selectedThemeIndex);
                        },
                        switchActiveColor:
                            dynamicTheme.dynamiccolorObj().starterColor,
                        switchType: SwitchType.material,
                        title: Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      );
                    }),
                    userlistTile("Select Theme", '', Icons.tab, () {
                      if (themeController.isDark.value) {
                        Toast.show("Please Disable Dark Theme First", context);
                      } else {
                        Navigator.pushNamed(
                            context, ThemeSelectorScreen.screename);
                      }
                    }),
                    userlistTile('Signout', '', Icons.exit_to_app, () {
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                    }),
                  ],
                ),
              )
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {
            getThemeManager(context).selectThemeAtIndex(1);
            print(getThemeManager(context).selectedThemeIndex);
            print("camera pressed");
          },
          child: Icon(
            Icons.camera_alt_outlined,
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
    );
  }

  Widget usertitile(String title) => Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2.copyWith(
            fontSize: SizeConfig.screenWidth / 16, fontWeight: FontWeight.bold),
      ));

  ListTile userlistTile(
      String title, String subtitle, IconData icon, Function ontap) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.headline4,
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: ontap,
    );
  }
}

class GetxBuilder {}
