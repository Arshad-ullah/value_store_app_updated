import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/Payment/PaymnetMain.dart';
import 'package:value_stories_app/core/constants/backendVariables.dart';
import 'package:value_stories_app/core/enums/view-state.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/core/view_models/base_view_model.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

class SignUpViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  setPasswrdVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  setConfirmPasswrdVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> signUpWithEmailPassword(TextEditingController email,
      TextEditingController password, TextEditingController userName) async {
    setState(ViewState.loading);
    List<String> a = [""];
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ))
        .user;

    if (user != null) {
      await FirebaseFirestore.instance.collection("Users List").add({
        'UserEmail': email.text,
        'UserName': userName.text,
        'UserUid': user.uid,
        "StoriesLocked": true,
        "LikedStories": a
      });

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
