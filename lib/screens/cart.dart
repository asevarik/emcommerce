import 'package:ECommerceApp/Common_utils/Widgets/CartscreenWidgets/CartFull.dart';
import 'package:ECommerceApp/Common_utils/Widgets/CartscreenWidgets/Cartempty.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static String RouteName = "Cartpage";
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: buildAppBar(context, cartProvider),
      body: cartProvider.getCartItems.isEmpty ? CartEmpty() : CartFullBody(),
      bottomNavigationBar:
          cartProvider.getCartItems.isEmpty ? null : CartCheckout(),
    );
  }
}
