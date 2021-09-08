import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:ECommerceApp/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsNavigationRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productAttributes = Provider.of<Product>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Product_Details(
              product: productAttributes,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        margin: EdgeInsets.only(right: 20.0, bottom: 5, top: 18),
        constraints: BoxConstraints(
            minHeight: 150, minWidth: double.infinity, maxHeight: 180),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: SizeConfig.blockSizeVertical * 180,
                decoration: BoxDecoration(
                  //!color for image background
                  color: productAttributes.color,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Hero(
                    tag: "${productAttributes.id}",
                    child: Image.asset(productAttributes.image)),
              ),
            ),
            FittedBox(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0)
                    ]),
                width: 160,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productAttributes.title,
                      maxLines: 4,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textSelectionColor),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text('US ${productAttributes.price} \$',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(productAttributes.productCategoryName,
                        style: TextStyle(color: Colors.grey, fontSize: 18.0)),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
