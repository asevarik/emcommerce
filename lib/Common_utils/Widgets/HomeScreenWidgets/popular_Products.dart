import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/feed.dart';
import 'package:ECommerceApp/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productAttributes = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favProvider = Provider.of<FavProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
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
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      width: 280,
                      color: productAttributes.color,
                      child: Hero(
                        tag: "${productAttributes.id}",
                        child: Image.network(productAttributes.image),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Icon(Icons.star,
                          color: favProvider.getFavItems
                                  .containsKey(productAttributes.id.toString())
                              ? Colors.red
                              : Colors.grey.shade800),
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Icon(Icons.star_border_outlined,
                          color: favProvider.getFavItems
                                  .containsKey(productAttributes.id.toString())
                              ? Colors.red
                              : Colors.white),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 32,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Text(
                          "\$${productAttributes.price}",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textSelectionTheme
                                  .selectionColor),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    color: Theme.of(context).primaryColorLight,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productAttributes.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(productAttributes.description,
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                              Expanded(
                                flex: 1,
                                child: Material(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: !cartProvider.getCartItems
                                              .containsKey(productAttributes.id
                                                  .toString())
                                          ? InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              onTap: () {
                                                cartProvider.addProductToCart(
                                                    productAttributes.id,
                                                    productAttributes.price,
                                                    productAttributes.title,
                                                    productAttributes.image);
                                              },
                                              child: Icon(
                                                Icons.add_shopping_cart,
                                                size: 25,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                            )
                                          : Icon(Icons.check_circle),
                                    )),
                              )
                            ],
                          )
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
