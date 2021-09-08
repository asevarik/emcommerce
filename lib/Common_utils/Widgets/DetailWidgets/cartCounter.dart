import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numofItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomOutlinedButton(
          press: () {
            if (numofItems == 0) {
            } else {
              setState(() {
                numofItems--;
              });
            }
          },
          icon: Icons.remove,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            numofItems.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        CustomOutlinedButton(
          press: () {
            setState(() {
              numofItems++;
            });
          },
          icon: Icons.add,
        )
      ],
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final Function press;
  final IconData icon;
  const CustomOutlinedButton({
    Key key,
    this.press,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 32,
      // ignore: deprecated_member_use
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        onPressed: press,
        child: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
