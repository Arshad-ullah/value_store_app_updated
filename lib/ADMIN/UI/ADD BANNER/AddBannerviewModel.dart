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

class AddBannerScreenViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  TextEditingController motivationalText = TextEditingController();
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController value3 = TextEditingController();
  TextEditingController value4 = TextEditingController();
  TextEditingController value5 = TextEditingController();
  TextEditingController value6 = TextEditingController();
  TextEditingController value7 = TextEditingController();
  TextEditingController importance = TextEditingController();
  TextEditingController aboutUs = TextEditingController();

  setPasswrdVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  setConfirmPasswrdVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> addBannerStory(
    String bannerPic,
    TextEditingController motivationText,
    TextEditingController value1,
    TextEditingController value2,
    TextEditingController value3,
    TextEditingController value4,
    TextEditingController value5,
    TextEditingController value6,
    TextEditingController value7,
    TextEditingController importance,
    TextEditingController aboutUs,
  ) async {
    setState(ViewState.loading);

    await FirebaseFirestore.instance.collection("Banner Stories").add({
      'BannerPic': bannerPic,
      'MotivationText': motivationText.text,
      'Value1': value1.text,
      'Value2': value2.text,
      'Value3': value3.text,
      'Value4': value4.text,
      'Value5': value5.text,
      'Value6': value6.text,
      'Value7': value7.text,
      "Importance": importance.text,
      "AboutUs": aboutUs.text,
    });

    if (fromProfile)
      Get.offAll(() => HomeScreen());
    else
      Get.offAll(() => PaymentMain());

    setState(ViewState.idle);
  }
}
