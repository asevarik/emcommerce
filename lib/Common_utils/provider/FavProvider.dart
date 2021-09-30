import 'package:ECommerceApp/Models/favs_Attibutes.dart';
import 'package:flutter/material.dart';

class FavProvider with ChangeNotifier {
  Map<String, FavAttr> _favItems = {};
  Map<String, FavAttr> get getFavItems {
    return {..._favItems};
  }

  void addAndRemoveFromFav(
      String productId, double price, String title, String imageUrl) {
    if (_favItems.containsKey(productId.toString())) {
      //TODO something in later
      removeItem(productId.toString());
    } else {
      _favItems.putIfAbsent(
          productId.toString(),
          () => FavAttr(
                id: DateTime.now().toString(),
                product_id: productId,
                producttitle: title,
                price: price,
                imageUrl: imageUrl,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _favItems.remove(productId);
    notifyListeners();
  }
}
