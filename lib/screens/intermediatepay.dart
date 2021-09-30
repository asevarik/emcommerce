import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:ECommerceApp/Services/Database.dart';
import 'package:ECommerceApp/screens/orders/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessPayment extends StatelessWidget {
  static String routeName = "SuccessPayment";
  DataBaseServices _db = DataBaseServices();
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartItems.forEach((key, ordervalue) {
      _db.setorders(AuthController.auth.currentUser.uid, ordervalue.product_id,
          ordervalue);
    });
    cartProvider.cleanCart();
    return OrderPage();
  }
}
