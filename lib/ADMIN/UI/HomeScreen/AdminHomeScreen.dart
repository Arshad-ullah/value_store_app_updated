import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/ADMIN/UI/ADD%20BANNER/AddBanner.dart';
import 'package:value_stories_app/ADMIN/UI/Addstory/AddStory.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/AdminTextFields.dart';
import 'package:value_stories_app/ui/custom_widgets/custom-text-field.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-view-model.dart';
import 'package:value_stories_app/ui/screens/auth_registration/sigup/signup-view-model.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  late DateTime _dateTime;
  DateTime selectedDate = DateTime.now();

  late String tripTime;
  late String tripTimeInDays;
  bool male = true;
  bool female = false;
  late DateTime policyEndDate;

  late File _imagePolicy;
  String paymentOption = "Card";

  bool _imagecheck = false;

  bool _picUploading = false;

  bool piccheck = false;
  bool _loading = false;

  late String _bannerPicture;

  DateTime dateOfBirth = DateTime.now();

  bool countryCodeSelected = false;
  String userAge = "0";

  //payment options
  bool card = true;
  bool cashondelivery = false;

  bool terms = false;
  DateTime policystartDate = DateTime.now();
  bool dateSelected = false;

  @override
  Widget build(BuildContext context) {
    return UtilityBaseScreen(
        appBarChild: _topAppBar(),

        ///
        ///body starts from here rora
        ///
        body: Container(
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/static_assets/logo.png'),
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Admin Pannel',
                  style: bHeadingTextStyle.copyWith(
                      fontSize: 22.sp, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.to(AddBannerScreen());
                },
                child: Container(
                  height: 100,
                  width: 1.sw / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      // color: redThemeColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: ExactAssetImage(
                            '$assets/bg_appbar.png',
                          ),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Banner',
                          style: bHeadingTextStyle.copyWith(
                              fontSize: 18.sp, color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.photo_library,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.to(AddStory());
                },
                child: Container(
                  height: 100,
                  width: 1.sw / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      // color: redThemeColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: ExactAssetImage(
                            '$assets/bg_appbar.png',
                          ),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Story',
                          style: bHeadingTextStyle.copyWith(
                              fontSize: 18.sp, color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

///
///signUpButton
///

_topAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          padding: EdgeInsets.zero,
          icon: ImageContainer(
            assetImage: "$assets/back_button_black.png",
            height: 20.18.h,
            width: 9.94.w,
          ),
          onPressed: () {
            print('back pressed');
            Get.back();
          }),
      Text('',
          // "Value Stories",
          style: leikoHeadingTextStyle.copyWith(
            fontSize: 26.sp,
            color: Colors.white,
            // fontWeight: FontWeight.bold
          )),
      Container(width: 20.sp)
    ],
  );
}
