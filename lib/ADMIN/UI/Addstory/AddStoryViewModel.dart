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

class AddStoryViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  TextEditingController storytittle = TextEditingController();
  TextEditingController writer = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController valueDiscovery = TextEditingController();

  setPasswrdVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  setConfirmPasswrdVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> addStory(
      String coverPicture,
      String storyAudio,
      TextEditingController storytittle,
      TextEditingController writer,
      TextEditingController body,
      TextEditingController valueDiscovery) async {
    setState(ViewState.loading);

    await FirebaseFirestore.instance.collection("Stories").add({
      "StoryCoverPic": coverPicture,
      "StoryMP3": storyAudio,
      "StoryTitle": storytittle.text,
      "StoryWriter": writer.text,
      "StoryBody": body.text,
      "ValueDiscovery": valueDiscovery.text
    });

    if (fromProfile)
      Get.offAll(() => HomeScreen());
    else
      Get.offAll(() => PaymentMain());

    setState(ViewState.idle);
  }
}
