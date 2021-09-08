import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCartBuyButton extends StatelessWidget {
  const AddCartBuyButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 4,
          right: SizeConfig.blockSizeHorizontal * 4),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: (cartProvider.getCartItems
                    .containsKey(product.id.toString()))
                ? Icon(Icons.check_circle)
                : OutlinedButton(
                    onPressed: () {
                      cartProvider.addProductToCart(product.id, product.price,
                          product.title, product.image);
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.black26)),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: product.color,
                    ),
                  ),
          ),
          Expanded(
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(product.color),
                overlayColor: MaterialStateProperty.all<Color>(Colors.black26),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: TextStyle(
                    color: (false) ? ColorsConsts.white : ColorsConsts.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
