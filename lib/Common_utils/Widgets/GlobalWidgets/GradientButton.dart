import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.press,
    @required this.title,
  }) : super(key: key);
  final Function press;
  final String title;
  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamictheme =
        DynamicColorChangerProvider(context);
    return SizedBox(
      width: SizeConfig.screenWidth / 2,
      height: SizeConfig.screenHeight / 15,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                dynamictheme.dynamiccolorObj().gradientLstart,
                dynamictheme.dynamiccolorObj().gradientLEnd,
              ],
            ),
            borderRadius: BorderRadius.circular(30)),
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
