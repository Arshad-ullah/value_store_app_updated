import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

class SliderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      ////
      ///body is here
      ///
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Column(
            children: [
              ///
              ///App bar custom one
              ///
              customAppBar(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 36, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Motivation',
                      style: headingTextStyle.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(bannerDetails["MotivationText"],
                        textAlign: TextAlign.left,
                        style: bodyTextStyle.copyWith(fontSize: 16.sp)),
                    SizedBox(
                      height: 29.h,
                    ),
                    Text(
                      '7 Values',
                      style: headingTextStyle.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Column(
                      children: List.generate(
                          7,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 9.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 6.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        bannerDetails[
                                            "Value" + (index + 1).toString()],
                                        style: bodyTextStyle.copyWith(
                                            fontSize: 16.sp),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    Text(
                      'Why is this Important for children',
                      style: headingTextStyle.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(bannerDetails["Importance"],
                        textAlign: TextAlign.left,
                        style: bodyTextStyle.copyWith(fontSize: 16.sp)),
                    SizedBox(
                      height: 29.h,
                    ),
                    Text(
                      'About us',
                      style: headingTextStyle.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(bannerDetails["AboutUs"],
                        textAlign: TextAlign.left,
                        style: bodyTextStyle.copyWith(fontSize: 16.sp)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  ///
  ///App bar custom one
  ///
  customAppBar() {
    return Container(
      height: 70.0.h,
      decoration: BoxDecoration(
          // color: redThemeColor,
          image: DecorationImage(
              image: ExactAssetImage('$assets/bg_appbar.png'),
              fit: BoxFit.cover)),
      child: Row(
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
          SizedBox(
            width: 40.0,
          )
        ],
      ),
    );
  }
}
