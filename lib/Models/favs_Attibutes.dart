import 'package:flutter/material.dart';

class FavAttr with ChangeNotifier {
  final String producttitle;
  final String id;
  final int product_id;
  final double price;
  final String imageUrl;
  FavAttr(
      {this.id, this.price, this.imageUrl, this.producttitle, this.product_id});
}
