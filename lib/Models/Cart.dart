import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String producttitle;
  final String id;
  final int product_id;
  final int quantity;
  final double price;
  final String imageUrl;
  Cart(
      {
      this.id,
      this.price,
      this.quantity,
      this.imageUrl,
      this.producttitle,
      this.product_id});
}

//test Data
// List<Cart> cartitems = [
//   Cart(
//       id: '1',
//       product_id: ,
//       producttitle: "Baap Computer1",
//       quantity: 2,
//       price: 20,
//       imageUrl: "assets/images/ComputerTransparent.png"),
//   Cart(
//       id: '2',
//       producttitle: "Baap Computer2",
//       quantity: 2,
//       price: 20,
//       imageUrl: "assets/images/ComputerTransparent.png"),
//   Cart(
//       id: '3',
//       producttitle: "Baap Computer3",
//       quantity: 2,
//       price: 20,
//       imageUrl: "assets/images/ComputerTransparent.png"),
//   Cart(
//       id: '4',
//       producttitle: "Baap Computer4",
//       quantity: 2,
//       price: 20,
//       imageUrl: "assets/images/ComputerTransparent.png"),
//   Cart(
//       id: '5',
//       producttitle: "Baap Computer5",
//       quantity: 2,
//       price: 20,
//       imageUrl: "assets/images/ComputerTransparent.png"),
//   Cart(
//       id: '6',
//       producttitle: "Baap Computer6",
//       quantity: 2,
//       price: 20,
//       imageUrl: "assets/images/ComputerTransparent.png"),
// ];
