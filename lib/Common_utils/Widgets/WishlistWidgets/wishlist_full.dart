import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/provider/FavProvider.dart';
import 'package:ECommerceApp/Models/favs_Attibutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistFull extends StatefulWidget {
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);

    return ListView.builder(
        itemCount: favProvider.getFavItems.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: favProvider.getFavItems.values.toList()[index],
              child: WishlistBox(favProvider: favProvider));
        });
  }
}

class WishlistBox extends StatelessWidget {
  final FavProvider favProvider;
  const WishlistBox({
    Key key,
    this.favProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favAttributes = Provider.of<FavAttr>(context);
    return Dismissible(
        key: Key(favAttributes.id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          favProvider.removeItem(favAttributes.product_id.toString());
        },
        background: Container(
          margin: EdgeInsets.only(top: 15, bottom: 5),
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
        child: WishlistTile(
          productname: favAttributes.producttitle,
          productImageurl: favAttributes.imageUrl,
          price: favAttributes.price.toString(),
        ));
  }
}

class WishlistTile extends StatelessWidget {
  final String productname, price;
  final String productImageurl;
  const WishlistTile({
    Key key,
    this.productname,
    this.price,
    this.productImageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamictheme =
        DynamicColorChangerProvider(context);

    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(20))),
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                dynamictheme.dynamiccolorObj().gradientLstart,
                dynamictheme.dynamiccolorObj().gradientLEnd,
              ]),
            ),
            child: Image.network(productImageurl)),
        title: Text(productname),
        subtitle: Text("\$${price}"),
      ),
    );
  }
}
