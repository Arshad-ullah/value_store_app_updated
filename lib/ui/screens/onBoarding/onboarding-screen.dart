import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/core/models/onboarding.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';
import 'package:value_stories_app/ui/screens/onBoarding/onboarding-view-model.dart';
// import 'package:get/get.dart';

// import '../../../../locator.dart';

///
///This screen is used as landing screen or onboarding which will be shown to user after splash screen
///
class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,

          ///
          ///[body] starts from here
          ///
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ///Page View builder having onboarding tiles
                  pageViewBuilder(model),
                  //womb like pageview indicator
                  wombIndicator(model),

                  //next or getstarted button
                  nextButton(
                    model,
                    onNextPressed: () {},
                    onGetStartedPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString('firstTime', "true");
                      Get.offAll(() => HomeScreen());
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //next or getstarted button
  nextButton(
    OnboardingViewModel model, {
    onNextPressed,
    onGetStartedPressed,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 19.h,
        ),
        Container(
          height: 88.h,
          width: 1.sw,
          color: mainThemeColor.withOpacity(0.20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              model.currentIndexPage! < 2
                  ? Container(
                      width: 100.w,
                      child: RoundedRaisedButton(
                        buttonText: "NEXT",
                        onPressed: () {
                          model.onboardController.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.ease);
                          onNextPressed();
                        },
                        color: mainThemeColor,
                      ),
                    )
                  : RoundedRaisedButton(
                      buttonText: "Get Started",
                      onPressed: () {
                        onGetStartedPressed();
                      },
                      color: mainThemeColor,
                    )
            ],
          ),
        )
      ],
    );
  }

  ///Page View builder having onboarding assets
  pageViewBuilder(OnboardingViewModel model) {
    return Container(
      alignment: Alignment.center,
      height: 700.h, //400,
      child: PageView.builder(
        controller: model.onboardController,
        itemCount: model.onboardings.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return onboardingTile(model.onboardings[index]);
        },
        //calling on pageChanged function to get index
        onPageChanged: (int index) {
          print(index);
          model.setCurrentIndexPage(index);
        },
      ),
    );
  }

  //womb like pageview indicator
  wombIndicator(OnboardingViewModel model) {
    return Container(
      child: SmoothPageIndicator(
        controller: model.onboardController,
        count: 3,
        effect: WormEffect(
            dotColor: greyColor.withOpacity(0.6),
            activeDotColor: greyColor2,
            spacing: 6.0,
            dotHeight: 10.h,
            dotWidth: 10.w),
      ),
    );
  }

  onboardingTile(OnBoarding onboard) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //onboarding assets
        Container(
          height: 460.h,
          width: 412.w,
          color: onboard.bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(
                width: onboard.dimensions!.width,
                height: onboard.dimensions!.height,
                assetImage: onboard.imageUrl,
              ),
            ],
          ),
        ),
        //onboarding title
        SizedBox(
          height: 20.h,
        ),
        Text("${onboard.title}",
          textAlign: TextAlign.center,
          style: headingTextStyle.copyWith(
              fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.h,
        ),
        //onboarding content

        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40.0),
          child: Text("${onboard.content}"
            ,
            textAlign: TextAlign.center,
            style: subBodyTextStyle.copyWith(fontSize: 18.sp),
          ),
        )
      ],
    );
  }
}
