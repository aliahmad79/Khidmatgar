import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Khidmatgar {
  static const String appName = 'khidmatgar';
  static SharedPreferences? sharedPreferences;
  static User? user;
  static FirebaseAuth? auth;
  static FirebaseFirestore? firebaseFirestore;

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  static String subCollectionAddress = "userAddress";

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhotoUrl = 'photoUrl';
  static final String userUID = 'uid';
  static final String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String isSuccess = 'isSuccess';
}
