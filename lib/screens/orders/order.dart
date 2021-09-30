import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Common_utils/provider/order_provider.dart';
import 'package:ECommerceApp/Models/user.dart';
import 'package:ECommerceApp/screens/orders/OrderFull.dart';
import 'package:ECommerceApp/screens/orders/Orderempty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class OrderPage extends StatefulWidget {
  static String RouteName = "OrderPage";

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    bool isOrder = false;
    //TODO:replace cart provider with order provider
    return FutureBuilder(
        future: orderProvider.fetchOrders(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: orderProvider.Orders.isEmpty
                ? null
                : buildAppBar(context, orderProvider),
            body: orderProvider.Orders.isEmpty ? OrderEmpty() : OrderFullBody(),
          );
        });
  }
}
