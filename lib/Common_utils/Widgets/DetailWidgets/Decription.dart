import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Text(product.description,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(height: 1.5, fontSize: 22)),
    );
  }
}
