import 'dart:io';

import 'package:ECommerceApp/Models/Cart.dart';
import 'package:ECommerceApp/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class DataBaseServices {
  Future<bool> userRegistration(
      String uid, name, String image, String phoneNumber, String email) async {
    var date = DateTime.now();
    var dateParse = DateTime.parse(date.toString());
    var formattedDate = "${dateParse.day} ${dateParse.month} ${dateParse.year}";
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'id': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'image': image,
      'JoinedAt': formattedDate,
    });
    return true;
  }

  Future<String> setphotoUrl(String name, File image) async {
    final ref =
        FirebaseStorage.instance.ref().child('UserImages').child(name + '.jpg');
    await ref.putFile(image);
    return await ref.getDownloadURL();
  }

  Future<UserData> getUserData(String uid) async {
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    UserData.name = userDoc.get('name');
    UserData.email = userDoc.get('email');
    UserData.phone = userDoc.get('phoneNumber');
    UserData.photourl = userDoc.get('image');
    UserData.joinedDate = userDoc.get('JoinedAt');
  }

  Future<void> setorders(
      String userid, String productId, Cart ordersetails) async {
    var uuid = Uuid();
    final orderid = uuid.v4();
    try {
      await FirebaseFirestore.instance.collection('order').doc(orderid).set({
        'orderId': orderid,
        'userId': userid,
        'productId': ordersetails.product_id,
        'title': ordersetails.producttitle,
        'imageUrl': ordersetails.imageUrl,
        'price': ordersetails.price * ordersetails.quantity,
        'quantity': ordersetails.quantity,
        'orderDate': Timestamp.now()
      });
    } catch (err) {
      print("error Occured");
    }
  }
}
