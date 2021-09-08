import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/material.dart';

class Product_With_Image extends StatelessWidget {
  const Product_With_Image({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title,
              style: Theme.of(context).textTheme.headline2.copyWith(
                  color: ColorsConsts.white, fontWeight: FontWeight.bold)),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 3,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Price\n ",
                        style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: ColorsConsts.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeVertical * 2,
              ),
              Expanded(
                child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(product.image, fit: BoxFit.fill)),
              )
            ],
          )
        ],
      ),
    );
  }
}
