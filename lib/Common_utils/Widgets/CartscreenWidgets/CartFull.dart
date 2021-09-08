import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/Widgets/GlobalWidgets/GradientButton.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// !this is the appBar of the Cart fullscreen
AppBar buildAppBar(BuildContext context, CartProvider cartProvider) {
  DynamicColorChangerProvider dynamicTheme =
      DynamicColorChangerProvider(context);
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            dynamicTheme.dynamiccolorObj().starterColor,
            dynamicTheme.dynamiccolorObj().endColor,
          ])),
    ),
    title: Column(
      children: [
        Text(
          "Your Items",
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          "${cartProvider.getCartItems.length} items",
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    ),
  );
}

//!this is the body of the Cart screen

class CartFullBody extends StatefulWidget {
  @override
  _CartFullBodyState createState() => _CartFullBodyState();
}

class _CartFullBodyState extends State<CartFullBody> {
  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamictheme =
        DynamicColorChangerProvider(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return ListView.builder(
        itemCount: cartProvider.getCartItems.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: cartProvider.getCartItems.values.toList()[index],
            child: Cart_Item_Box(
                dynamictheme: dynamictheme, cartProvider: cartProvider),
          );
        });
  }
}

class Cart_Item_Box extends StatelessWidget {
  const Cart_Item_Box({
    Key key,
    @required this.dynamictheme,
    @required this.cartProvider,
  }) : super(key: key);
  final CartProvider cartProvider;
  final DynamicColorChangerProvider dynamictheme;

  @override
  Widget build(BuildContext context) {
    final cartAttributes = Provider.of<Cart>(context);
    return Container(
      height: 240,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cartProvider.removeItem(cartAttributes.product_id.toString());
        },
        key: Key(cartAttributes.product_id.toString()),
        background: Container(
          margin: EdgeInsets.only(top: 74, bottom: 44),
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Spacer(),
              Icon(
                Icons.delete_outline_outlined,
                color: Colors.red[400],
                size: 40,
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          dynamictheme.dynamiccolorObj().gradientLstart,
                          dynamictheme.dynamiccolorObj().gradientLEnd,
                        ]),
                        borderRadius: BorderRadius.circular(25.0)),
                    margin: EdgeInsets.only(top: 45, left: 5, bottom: 20),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(cartAttributes.imageUrl),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 66, bottom: 37),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${cartAttributes.producttitle}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Price: \$ ${cartAttributes.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 15),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: FloatingActionButton(
                            backgroundColor: cartAttributes.quantity < 2
                                ? Theme.of(context).disabledColor
                                : Theme.of(context)
                                    .floatingActionButtonTheme
                                    .backgroundColor,
                            onPressed: cartAttributes.quantity < 2
                                ? null
                                : () {
                                    cartProvider.reduceOneQuantityFromCart(
                                        cartAttributes.product_id,
                                        cartAttributes.price,
                                        cartAttributes.producttitle,
                                        cartAttributes.imageUrl);
                                  },
                            child: Icon(
                              Icons.remove,
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          cartAttributes.quantity.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: FloatingActionButton(
                            onPressed: () {
                              cartProvider.addProductToCart(
                                  cartAttributes.product_id,
                                  cartAttributes.price,
                                  cartAttributes.producttitle,
                                  cartAttributes.imageUrl);
                            },
                            child: Icon(
                              Icons.add,
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                            ),
                          ),
                        ),
                      ],
                    )
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

//! Below is the bottomAppBAR or checkout part of the cart

class CartCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 20),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.30))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                  text: "Total:\n",
                  style: Theme.of(context).textTheme.headline3,
                  children: [
                    TextSpan(
                      text: "\$${cartProvider.totalAmount}",
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ]),
            ),
            GradientButton(
              title: "Checkout",
              press: () {},
            ),
          ],
        ));
  }
}
