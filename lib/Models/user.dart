import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:ECommerceApp/Services/Database.dart';

class UserData {
  static String name;
  static String phone;
  static String email;
  static String photourl;
  static String joinedDate;

  void getuserData() async {
    await DataBaseServices().getUserData(AuthController.auth.currentUser.uid);
  }

  void cleanUserData() {
    UserData.name = '';
    UserData.phone = '';
    UserData.email = '';
    UserData.photourl = '';
    UserData.joinedDate = '';
  }
}
