import 'package:ECommerceApp/Common_utils/Widgets/FeedScreenWidgets/feed_Widgets.dart';
import 'package:ECommerceApp/Common_utils/provider/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  static String Routename = "FeedScreen";
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    final popular = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: feedAppbar(false, context, "Feeds"),
        extendBodyBehindAppBar: true,
        body: Body(
          products: (popular == "popular")
              ? productsProvider.popularProducts
              : productsProvider.products,
        ));
  }
}
