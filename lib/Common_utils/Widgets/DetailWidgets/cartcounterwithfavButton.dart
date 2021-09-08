import 'package:ECommerceApp/Common_utils/Widgets/DetailWidgets/cartCounter.dart';
import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CarCounterwith_favbutton extends StatelessWidget {
  final Product product;
  const CarCounterwith_favbutton({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartCounter(),
          GestureDetector(
            onTap: () {
              favProvider.addAndRemoveFromFav(
                  product.id, product.price, product.title, product.image);
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.all(8),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: !favProvider.getFavItems
                          .containsKey(product.id.toString())
                      ? Colors.grey
                      : Color(0xFFFF6464),
                  shape: BoxShape.circle),
              child: SvgPicture.asset("assets/assets_for_feed/icons/heart.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
