import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/AddcartBuyButton.dart';
import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/ColorAndSize.dart';
import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/Decription.dart';
import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/ProductwithImage.dart';
import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/cartcounterwithfavButton.dart';
import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:ECommerceApp/screens/Wishlist.dart';
import 'package:ECommerceApp/screens/cart.dart';
import 'package:ECommerceApp/screens/search.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//!APP Bar of Details Widgets
AppBar details_appBar(BuildContext context, Product product) {
  final favProvider = Provider.of<FavProvider>(context);
  final cartProvider = Provider.of<CartProvider>(context);

  return AppBar(
    backgroundColor: product.color,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back,
        size: SizeConfig.screenWidth / 13,
        color: Colors.white70,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Search.routeName);
        },
        icon: Icon(
          Icons.search_sharp,
          size: SizeConfig.screenWidth / 13,
          color: Colors.white70,
        ),
      ),
      SizedBox(
        width: 10,
      ),
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

//!Body of Details Screen

class Details_Body extends StatelessWidget {
  final Product product;

  const Details_Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: SizeConfig.blockSizeVertical * 2),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0))),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      Description(product: product),
                      CarCounterwith_favbutton(
                        product: product,
                      ),
                      AddCartBuyButton(
                        product: product,
                      )
                    ],
                  ),
                ),
                Product_With_Image(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
