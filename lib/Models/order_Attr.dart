import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderAttr with ChangeNotifier {
  final String orderId;
  final String userId;
  final String productId;
  final String title;
  final String imageUrl;
  final String quantity;
  final String price;
  final Timestamp orderdate;

  OrderAttr(
      {this.orderId,
      this.userId,
      this.productId,
      this.title,
      this.imageUrl,
      this.quantity,
      this.orderdate,
      this.price});
}
