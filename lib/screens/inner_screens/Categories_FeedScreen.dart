import 'package:ECommerceApp/Common_utils/Widgets/FeedScreenWidgets/feed_Widgets.dart';
import 'package:ECommerceApp/Common_utils/provider/Products.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryFeedPage extends StatelessWidget {
  static String routeName = "CategoryFeedScreen";
  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final categoryName = ModalRoute.of(context).settings.arguments as String;
    List<Product> productlist = productsProvider.findByCategory(categoryName);
    if (categoryName == "popular products") {
      productlist = productsProvider.popularProducts;
    }
    return Scaffold(
        appBar: feedAppbar(false, context, categoryName),
        extendBodyBehindAppBar: true,
        body: Body(
          products: productlist,
        ));
  }
}
