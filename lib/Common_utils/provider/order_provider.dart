import 'package:ECommerceApp/Models/feed.dart';
import 'package:ECommerceApp/Models/order_Attr.dart';
import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<OrderAttr> _Orders = [];
  Future<void> fetchOrders() async {
    await FirebaseFirestore.instance
        .collection('order')
        .where('userId', isEqualTo: AuthController.auth.currentUser.uid)
        .get()
        .then((QuerySnapshot OrderSnapshot) {
      _Orders.clear();
      OrderSnapshot.docs.forEach((element) {
        _Orders.insert(
          0,
          OrderAttr(
              orderId: element.get('orderId'),
              userId: element.get('userId'),
              productId: element.get('productId'),
              title: element.get('title'),
              quantity: element.get('quantity').toString(),
              orderdate: element.get('orderDate'),
              imageUrl: element.get('imageUrl'),
              price: element.get('price').toString()),
        );
      });
    });
  }

  List<OrderAttr> get Orders {
    return [..._Orders];
  }
}
