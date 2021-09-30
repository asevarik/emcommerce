import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/Dark_Theme_provider.dart';
import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:ECommerceApp/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FeedDialog extends StatelessWidget {
  final Product product;
  const FeedDialog({@required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final FavProvider favProvider = Provider.of<FavProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: product.color,
            ),
            child: Image.network(product.image),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: dialogContent(context, 0, () {
                      favProvider.addAndRemoveFromFav(product.id, product.price,
                          product.title, product.image);
                    }),
                  ),
                  Flexible(
                    child: dialogContent(context, 1, () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Product_Details(
                                  product: product,
                                ),
                              ))
                          .then((value) => Navigator.canPop(context)
                              ? Navigator.pop(context)
                              : null);
                    }),
                  ),
                  Flexible(
                    child: dialogContent(context, 2, () {
                      cartProvider.addProductToCart(product.id, product.price,
                          product.title, product.image);
                    }),
                  ),
                ]),
          ),

          /************close****************/
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.3),
                shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.grey,
                onTap: () =>
                    Navigator.canPop(context) ? Navigator.pop(context) : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close, size: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget dialogContent(BuildContext context, int index, Function fct) {
    final cart = Provider.of<CartProvider>(context);
    final favs = Provider.of<FavProvider>(context);
    List<IconData> _dialogIcons = [
      favs.getFavItems.containsKey(product.id.toString())
          ? Icons.favorite
          : Icons.favorite_border,
      Icons.remove_red_eye_outlined,
      Icons.shopping_cart_outlined,
      CupertinoIcons.trash,
    ];
    final ThemeController themeController = Get.find();

    List<String> _texts = [
      favs.getFavItems.containsKey(product.id.toString())
          ? 'In wishlist'
          : 'Add to wishlist',
      'View product',
      cart.getCartItems.containsKey(product.id.toString())
          ? 'In Cart '
          : 'Add to cart',
    ];
    List<Color> _colors = [
      favs.getFavItems.containsKey(product.id.toString())
          ? Colors.red
          : Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
    ];
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: fct,
          splashColor: Colors.grey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    // inkwell color
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          _dialogIcons[index],
                          color: _colors[index],
                          size: 25,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Text(
                      _texts[index],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        //  fontSize: 15,
                        color: themeController.isDark.value
                            ? Theme.of(context).disabledColor
                            : ColorsConsts.subTitle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
