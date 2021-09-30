import 'package:ECommerceApp/Common_utils/Widgets/CartscreenWidgets/CartFull.dart';
import 'package:ECommerceApp/Common_utils/Widgets/WishlistWidgets/WishlistEmpty.dart';
import 'package:ECommerceApp/Common_utils/Widgets/WishlistWidgets/wishlist_full.dart';
import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Models/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  static String RouteName = "Wishlistpage";
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);
    return Scaffold(
        appBar: favProvider.getFavItems.isEmpty ? null : WishlistAppBar(context,favProvider),
        body: favProvider.getFavItems.isEmpty ? WishListEmpty() : WishlistFull());
  }

  AppBar WishlistAppBar(BuildContext context,FavProvider favProvider) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      title: Column(
        children: [
          Text(
            "Your Wishlist(${favProvider.getFavItems.length})",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
