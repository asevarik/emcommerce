import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/screens/inner_screens/Categories_FeedScreen.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({Key key, this.index}) : super(key: key);

  final int index;

  List<Map<String, Object>> categories = [
    {
      'Categoryname': 'Phones',
      'CategoryImagePath': 'assets/images/CatPhones.png',
    },
    {
      'Categoryname': 'Clothes',
      'CategoryImagePath': 'assets/images/CatClothes.jpg',
    },
    {
      'Categoryname': 'Bags',
      'CategoryImagePath': 'assets/images/CatBags.jpg',
    },
    {
      'Categoryname': 'Laptops',
      'CategoryImagePath': 'assets/images/CatLaptops.png',
    },
    {
      'Categoryname': 'Shoes',
      'CategoryImagePath': 'assets/images/CatShoes.jpg',
    },
    {
      'Categoryname': 'Watches',
      'CategoryImagePath': 'assets/images/CatWatches.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoryFeedPage.routeName,
                arguments: '${categories[index]['Categoryname']}');
            // print('${categories[index]['Categoryname']}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(categories[index]['CategoryImagePath']),
                  fit: BoxFit.cover),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 200,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          left: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Colors.transparent,
            child: Text(
              categories[index]['Categoryname'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsConsts.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
