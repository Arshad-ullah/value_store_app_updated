import 'package:flutter/cupertino.dart';
import 'package:value_stories_app/core/constants/dimensions.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/enums/view-state.dart';
import 'package:value_stories_app/core/models/onboarding.dart';
import 'package:value_stories_app/core/view_models/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel {
  OnboardingViewModel() {
    //injecting onboardings data
    injectOnboardings();
    onboardController = PageController(initialPage: 0);
    currentIndexPage = 0;
  }

  int? currentIndexPage;
  PageController onboardController=PageController();
  List<OnBoarding> onboardings = [];

  setCurrentIndexPage(int index) {
    currentIndexPage = index;
    setState(ViewState.idle);
  }

  injectOnboardings() {
    onboardings.add(OnBoarding(
        bgColor: Color(0xFF34B67A).withOpacity(0.18),
        dimensions: Dimensions(height: 252.91.h, width: 284.76.w),
        imageUrl: "$assets/explore.png",
        title: "Lorem Ipsum",
        content:
            "Here you can read and listen the books you like and get the tasty fishes for Ochi!"));

    onboardings.add(OnBoarding(
      bgColor: Color(0XFF3AA3D0).withOpacity(0.18),
      dimensions: Dimensions(height: 238.95.h, width: 238.44.w),
      imageUrl: "$assets/globe.png",
      title: "Choose your Language",
      content:
          "Here you can read and listen the books you like and get the tasty fishes for Ochi!",
    ));
    onboardings.add(OnBoarding(
        bgColor: Color(0XFF459ADB).withOpacity(0.18),
        dimensions: Dimensions(height: 257.17.h, width: 196.72.w),
        imageUrl: "$assets/books.png",
        title: "Audible Stories",
        content:
            "Here you can read and listen the books you like and get the tasty fishes for Ochi!"));
  }
}
