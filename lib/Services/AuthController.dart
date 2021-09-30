import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> userRegisteration(String email, String password) async {
    try {
      UserCredential _user = await auth.createUserWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim());
      return true.toString();
    } catch (error) {
      return error.message;
    }
  }

  User getUser() {
    return auth.currentUser;
  }

  Future<String> userLogin(String email, String password) async {
    try {
      UserCredential _user = await auth.signInWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim());
      return true.toString();
    } catch (error) {
      return error.message;
    }
  }

  Future<void> userSignout() async {
    auth.signOut();
  }

  Future<String> googleSignIn() async {
    final googleSignin = GoogleSignIn();
    print("inside google signin");
    final googleAccount = await googleSignin.signIn();
    if (googleAccount != null) {
      final googleauth = await googleAccount.authentication;
      if (googleauth.accessToken != null && googleauth.idToken != null) {
        try {
          final result = await auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleauth.idToken,
                  accessToken: googleauth.accessToken));
        } catch (error) {
          return error.message;
        }
      }
    }
    return 'true';
  }

  Future<void> forgotPassword(String email) async{
   await auth.sendPasswordResetEmail(email: email);
   
  }
}
