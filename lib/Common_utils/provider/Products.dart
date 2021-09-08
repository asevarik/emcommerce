import 'package:ECommerceApp/Models/feed.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 1,
      title: "Office Code",
      price: 230,
      size: 12,
      description: dummyText,
      image: "assets/assets_for_feed/images/Bags/Bag_1.png",
      color: Color(0xFF3D82AE),
      productCategoryName: "Bags",
      quantity: 0,
      isFavorite: false,
      isPopular: false,
      brand: "H&M",
    ),
    Product(
      id: 2,
      title: "Belt Bag",
      price: 245,
      size: 8,
      description: dummyText,
      image: "assets/assets_for_feed/images/Bags/Bag_2.png",
      color: Colors.lightBlueAccent,
      productCategoryName: "Bags",
      quantity: 0,
      isFavorite: false,
      isPopular: false,
      brand: "H&M",
    ),
    Product(
      id: 3,
      title: "Hang Top",
      price: 278,
      size: 10,
      description: dummyText,
      image: "assets/assets_for_feed/images/Bags/Bag_3.png",
      color: Colors.brown.shade300,
      productCategoryName: "Bags",
      quantity: 0,
      isFavorite: false,
      isPopular: true,
      brand: "H&M",
    ),
    Product(
      id: 4,
      title: "Old Fashion",
      price: 260,
      size: 11,
      description: dummyText,
      image: "assets/assets_for_feed/images/Bags/Bag_4.png",
      color: Colors.indigo.shade900,
      productCategoryName: "Bags",
      quantity: 0,
      isFavorite: false,
      isPopular: true,
      brand: "H&M",
    ),
    Product(
      id: 5,
      title: "Office Code",
      price: 225,
      size: 12,
      description: dummyText,
      image: "assets/assets_for_feed/images/Bags/Bag_5.png",
      color: Color(0xFFFB7883),
      productCategoryName: "Bags",
      quantity: 0,
      isFavorite: false,
      isPopular: true,
      brand: "H&M",
    ),
    Product(
      id: 6,
      title: "Office Code",
      price: 250,
      size: 12,
      description: dummyText,
      image: "assets/assets_for_feed/images/Bags/Bag_6.png",
      color: Color(0xFFAEAEAE),
      productCategoryName: "Bags",
      quantity: 0,
      isFavorite: false,
      isPopular: true,
      brand: "H&M",
    ),
    Product(
      id: 7,
      title: "Iphone 5",
      price: 250,
      size: 12,
      description: dummyText,
      image: "assets/assets_for_feed/images/Phones/Phone1.png",
      color: Color(0xFFE040FB),
      productCategoryName: "Phones",
      quantity: 0,
      isFavorite: false,
      isPopular: true,
      brand: "Apple",
    ),
    Product(
      id: 8,
      title: "Iphone X",
      price: 250,
      size: 12,
      description: dummyText,
      image: "assets/assets_for_feed/images/Phones/Phone2.png",
      color: Color(0xff3d5a80),
      productCategoryName: "Phones",
      quantity: 0,
      isFavorite: false,
      isPopular: true,
      brand: "Apple",
    ),
  ];
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
