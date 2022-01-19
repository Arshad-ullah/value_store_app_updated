import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
import 'package:value_stories_app/ui/screens/story/story-screen.dart';

class AboutStoryScreen extends StatelessWidget {
  final dynamic storyDetails;
  AboutStoryScreen(this.storyDetails);
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
                  left: 15,
                  right: 15,
                  top: 15,
                ),
                child: Column(
                  children: [
                    ///cover story pic
                    storyCover(),

                    //title
                    titleAndAuthor(),

                    //about Story
                    aboutStory(),
                  ],
                ),
              ),
              //read more button
              readMoreButton(),
            ],
          ),
        ),
      ),
    ));
  }

  ///cover story pic
  storyCover() {
    return InkWell(
      onTap: () {
        Get.off(() => StoryScreen(storyDetails));
      },
      child: Container(
        height: 294.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(storyDetails["StoryCoverPic"]),
                fit: BoxFit.cover)),
      ),
    );
  }

  //title
  titleAndAuthor() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                storyDetails["StoryTitle"],
                style: headingTextStyle.copyWith(
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'by ' + storyDetails["StoryWriter"],
                  style: bodyTextStyle.copyWith(
                    fontSize: 18.sp,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1.6.h,
            color: Colors.grey.withOpacity(0.3),
          )
        ],
      ),
    );
  }

  //about Story
  aboutStory() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 30.0),
      child: Container(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                style: bodyTextStyle.copyWith(
                    color: Colors.black, fontSize: 16.sp, wordSpacing: 3),
                text: storyDetails["ValueDiscovery"]),
            // TextSpan(
            //     text: "ReadMore",
            //     style: headingTextStyle.copyWith(
            //         color: Colors.black,
            //         fontSize: 16.sp,
            //         decoration: TextDecoration.underline))
          ]),
        ),
      ),
    );
  }

  readMoreButton() {
    return Column(
      children: [
        Container(
          height: 88.h,
          width: 1.sw,
          color: mainThemeColor.withOpacity(0.20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // width: 100.w,
                child: RoundedRaisedButton(
                  buttonText: "READ NOW",
                  onPressed: () {
                    Get.off(() => StoryScreen(storyDetails));
                  },
                  color: mainThemeColor,
                ),
              )
            ],
          ),
        )
      ],
    );
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
                color: Colors.black,
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
