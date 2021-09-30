import 'package:ECommerceApp/Models/user.dart';
import 'package:ECommerceApp/screens/bottom_bar.dart';
import 'package:ECommerceApp/screens/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends StatefulWidget {
  @override
  _UserStateState createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, usersnapshot) {
          if (usersnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (usersnapshot.connectionState == ConnectionState.active) {
            if (usersnapshot.hasData) {
              void getsetUserData() async {
                await UserData().getuserData();
              }

              getsetUserData();

              return BottomBarScreen();
            } else {
              return LandingPage();
            }
          } else {
            return Center(
              child: Text("Some Error Occured"),
            );
          }
        });
  }
}
