import 'package:ECommerceApp/Models/feed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      productSnapshot.docs.forEach((element) {
        _products.insert(
          0,
          Product(
            id: element.get('productId'),
            title: element.get('productTitle'),
            price: double.parse(
              element.get('price'),
            ),
            size: int.parse(element.get('productSize')),
            description: element.get('productDescription'),
            image: element.get('productImage'),
            color: Color(int.parse(element.get('Color'))).withOpacity(1.0),
            productCategoryName: element.get('productCategory'),
            quantity: int.parse(
              element.get('price'),
            ),
            isFavorite: false,
            isPopular: true,
            brand: element.get('productBrand'),
          ),
        );
      });
    });
  }

  List<Product> get products {
    return [..._products];
  }

  List<Product> findByCategory(String catergoryName) {
    List _categoryList = _products
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(catergoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  List<Product> findByBrand(String brandName) {
    List _brandList = _products
        .where((element) =>
            element.brand.toLowerCase().contains(brandName.toLowerCase()))
        .toList();
    return _brandList;
  }

  List<Product> searchQuery(String searchText) {
    List _searchList = _products
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }
}

//ye class se bahar he
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
