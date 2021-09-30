import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/order_provider.dart';
import 'package:ECommerceApp/Models/order_Attr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// !this is the appBar of the Cart fullscreen
AppBar buildAppBar(BuildContext context, OrderProvider orderProvider) {
  DynamicColorChangerProvider dynamicTheme =
      DynamicColorChangerProvider(context);
  return AppBar(
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
    title: Column(
      children: [
        Text(
          "Your Items",
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          "${orderProvider.Orders.length} items",
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    ),
  );
}

//!this is the body of the Cart screen

class OrderFullBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamictheme =
        DynamicColorChangerProvider(context);
    final orderProvider = Provider.of<OrderProvider>(context);

    return FutureBuilder(
        future: orderProvider.fetchOrders(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: orderProvider.Orders.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: orderProvider.Orders[index], child: WishlistBox());
              });
        });
  }
}

class WishlistBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderAttr = Provider.of<OrderAttr>(context);
    return WishlistTile(
      productname: orderAttr.title,
      productImageurl: orderAttr.imageUrl,
      price: orderAttr.price,
      orderDate: orderAttr.orderdate,
      quantity: orderAttr.quantity,
      orderId: orderAttr.orderId,
    );
  }
}

class WishlistTile extends StatelessWidget {
  final String productname, price;
  final String productImageurl;
  final String quantity;
  final Timestamp orderDate;
  final String orderId;
  const WishlistTile(
      {Key key,
      this.productname,
      this.price,
      this.productImageurl,
      this.quantity,
      this.orderDate,
      this.orderId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamictheme =
        DynamicColorChangerProvider(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(20))),
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                dynamictheme.dynamiccolorObj().gradientLstart,
                dynamictheme.dynamiccolorObj().gradientLEnd,
              ]),
            ),
            child: Image.network(productImageurl)),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productname),
            SizedBox(
              height: 5,
            ),
            Text("\$$price"),
            SizedBox(
              height: 5,
            ),
            Text(
              'OrderDate: ${DateTime.fromMillisecondsSinceEpoch(orderDate.millisecondsSinceEpoch)}',
            ),
            SizedBox(
              height: 5,
            ),
            Text('Quantity:$quantity'),
            SizedBox(
              height: 5,
            ),
            Text("order Id:$orderId")
          ],
        ),
      ),
    );
  }
}
