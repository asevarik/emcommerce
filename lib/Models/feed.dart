import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String image, title, description, productCategoryName, brand,id;
  final int  size, quantity;
  final double price;
  final bool isFavorite, isPopular;
  final Color color;
  Product(
      {this.productCategoryName,
      this.brand,
      this.quantity,
      this.isFavorite,
      this.isPopular,
      this.id,
      this.size,
      this.image,
      this.color,
      this.description,
      this.price,
      this.title});
}
