import 'package:ECommerceApp/Models/Cart.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};
  Map<String, Cart> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addProductToCart(
      int productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId.toString())) {
      _cartItems.update(
          productId.toString(),
          (exsistingCartItem) => Cart(
              product_id: exsistingCartItem.product_id,
              producttitle: exsistingCartItem.producttitle,
              price: exsistingCartItem.price,
              quantity: exsistingCartItem.quantity + 1,
              imageUrl: exsistingCartItem.imageUrl));
    } else {
      _cartItems.putIfAbsent(
          productId.toString(),
          () => Cart(
                id: DateTime.now().toString(),
                product_id: productId,
                producttitle: title,
                price: price,
                quantity: 1,
                imageUrl: imageUrl,
              ));
    }
    notifyListeners();
  }

  void reduceOneQuantityFromCart(
      int productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId.toString())) {
      _cartItems.update(
          productId.toString(),
          (exsistingCartItem) => Cart(
              product_id: exsistingCartItem.product_id,
              producttitle: exsistingCartItem.producttitle,
              price: exsistingCartItem.price,
              quantity: exsistingCartItem.quantity - 1,
              imageUrl: exsistingCartItem.imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}
