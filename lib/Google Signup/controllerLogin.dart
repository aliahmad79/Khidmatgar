import 'package:fiazproject/Google%20Signup/userDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerLogin with ChangeNotifier {
  var googleSignInNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetailsModel? userDetailsModel;

  allowUserTOLogin() async {
    this.googleSignInAccount = await googleSignInNow.signIn();
    this.userDetailsModel = new UserDetailsModel(
        displayName: this.googleSignInAccount!.displayName,
        email: this.googleSignInAccount!.email,
        photoURL: this.googleSignInAccount!.photoUrl);
    notifyListeners();
  }

  allowUserLogOut() async {
    this.googleSignInAccount = await googleSignInNow.signOut();
    userDetailsModel = null;
    notifyListeners();
  }
}
