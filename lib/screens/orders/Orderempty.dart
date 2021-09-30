import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Widgets/GlobalWidgets/GradientButton.dart';
import 'package:ECommerceApp/screens/feed.dart';
import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: SizeConfig.screenHeight / 10),
          width: double.infinity,
          height: MediaQuery.maybeOf(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/emptycart.png'))),
        ),
        Text("Your Order is Empty",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2),
        SizedBox(
          height: 30,
        ),
        Text("Order something and make us happy",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2),
        SizedBox(
          height: SizeConfig.screenHeight / 18,
        ),
        GradientButton(
            press: () {
              Navigator.of(context).pushNamed(FeedPage.Routename);
            },
            title: "Shop Now"),
      ],
    );
  }
}
