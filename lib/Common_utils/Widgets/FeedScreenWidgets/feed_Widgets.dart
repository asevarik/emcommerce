import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/Widgets/FeedScreenWidgets/Feed_ItemCard.dart';
import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Common_utils/provider/Products.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:ECommerceApp/screens/Wishlist.dart';
import 'package:ECommerceApp/screens/cart.dart';
import 'package:ECommerceApp/screens/product_details.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//!AppBAr of Feed Screen
AppBar feedAppbar(bool themechanger, BuildContext context, String title) {
  DynamicColorChangerProvider dynamicTheme =
      DynamicColorChangerProvider(context);
  final favProvider = Provider.of<FavProvider>(context);
  final cartProvider = Provider.of<CartProvider>(context);

  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline1,
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            dynamicTheme.dynamiccolorObj().starterColor,
            dynamicTheme.dynamiccolorObj().endColor,
          ])),
    ),
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(WishListPage.RouteName);
        },
        icon: favProvider.getFavItems.isNotEmpty
            ? Badge(
                badgeContent: Text(
                  favProvider.getFavItems.length.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: ColorsConsts.white),
                ),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white70,
                ),
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.white70,
              ),
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CartPage.RouteName);
        },
        icon: (cartProvider.getCartItems.isNotEmpty)
            ? Badge(
                badgeContent: Text(
                  cartProvider.getCartItems.length.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: ColorsConsts.white),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white70,
                ),
              )
            : Icon(
                Icons.shopping_cart_outlined,
                size: SizeConfig.screenWidth / 13,
                color: Colors.white70,
              ),
      ),
    ],
  );
}

//?MARK: !Body of FeedScreen

class Body extends StatelessWidget {
  const Body({
    Key key,
    this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.blockSizeVertical * 2,
          right: SizeConfig.blockSizeVertical * 2,
        ),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.74,
                mainAxisSpacing: SizeConfig.screenHeight / 50,
                crossAxisSpacing: SizeConfig.screenWidth / 15),
            itemBuilder: (BuildContext context, int index) {
              return Feed_Item_Card(
                product: products[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product_Details(
                      product: products[index],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
