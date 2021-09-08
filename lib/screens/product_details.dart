import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/DetailWidgets.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/material.dart';

class Product_Details extends StatelessWidget {
  final Product product;
  static final routeName = "Product_Details";
  const Product_Details({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: details_appBar(context, product),
      body: Details_Body(
        product: product,
      ),
    );
  }
}
