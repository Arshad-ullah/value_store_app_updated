import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/Payment/PaymnetMain.dart';
import 'package:value_stories_app/core/constants/backendVariables.dart';
import 'package:value_stories_app/core/enums/view-state.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/core/view_models/base_view_model.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

class LoginViewModel extends BaseViewModel {
  bool isPasswordVisible = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  setPasswrdVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<void> signInWithEmailPassword(
      TextEditingController email, TextEditingController password) async {
    setState(ViewState.loading);

    final User? user = (await _auth.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ))
        .user;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection("Users List")
          .where("UserUid", isEqualTo: user.uid)
          .get()
          .then((value) async => {
                print("hiii2"),
                userDetails = UserDetails(
                    email: value.docs[0]["UserEmail"],
                    userDocid: value.docs[0].id,
                    username: value.docs[0]["UserName"],
                    userUid: value.docs[0]["UserUid"],
                    storiesLocked: value.docs[0]["StoriesLocked"],
                    likedStories: value.docs[0]["LikedStories"])
              });

      print(4);
    }
    var prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {
        'userEmail': user!.email,
        'userUid': user.uid,
      },
    );
    prefs.setString('UserData', userData);

    if (fromProfile)
      Get.offAll(() => HomeScreen());
    else
      Get.offAll(() => PaymentMain());

    setState(ViewState.idle);
  }
}
