import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Widgets/FeedScreenWidgets/feeds.dialog.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class Feed_Item_Card extends StatelessWidget {
  final Product product;
  final Function press;
  const Feed_Item_Card({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: press,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.screenHeight / 80),
                  decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(16)),
                  child: Hero(
                      tag: "${product.id}", child: Image.asset(product.image)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight / 200),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Text(
                      "\$ ${product.price.toString()}",
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
                GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              FeedDialog(product: product));
                    },
                    child: Icon(Icons.more_horiz)),
              ],
            ),
          ],
        ),
        Badge(
          toAnimate: true,
          shape: BadgeShape.square,
          badgeColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
          badgeContent: Text('new', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
