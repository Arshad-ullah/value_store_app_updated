import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/ADMIN/UI/HomeScreen/AdminHomeScreen.dart';

import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

import 'onBoarding/onboarding-screen.dart';
// import 'package:get/get.dart';
// import '../../locator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // final authDataService = locator<AuthDataService>();
  // final _dbService = locator<DatabaseService>();
  // final _locationService = locator<LocationService>();
  // final _geocodingService = locator<GeocodingApiService>();

  @override
  void didChangeDependencies() async {
    Future.delayed(Duration(seconds: 4), () async {
      var prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey("firstTime")) {
        if (prefs.containsKey("UserData")) {
          final extractedUserData =
              json.decode(prefs.getString("UserData").toString()) as Map<String, Object>;

          await FirebaseFirestore.instance
              .collection("Users List")
              .where("UserUid", isEqualTo: extractedUserData['userUid'])
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
        }
        // setState(() {
        //   stroiesLock = userDetails.storiesLocked;
        // });
        Get.offAll(() => HomeScreen());
        // Get.offAll(() => AdminHomeScreen());
      } else
        Get.offAll(() => OnBoardingScreen());
    });
    _initialSetup();

    super.didChangeDependencies();
  }

  _initialSetup() async {
    // await authDataService.doSetup();
    // //using location service getting current CORDINATES
    // await _locationService.getCurrentLocation();
    // if (!_locationService.patientPosition.isNullOrBlank) {
    //   //initializing geoCoding APi Service of google for exact [reverse-geocoding] purpose
    //   await _geocodingService.initGeocodingService(
    //       lat: _locationService.patientPosition.latitude,
    //       lng: _locationService.patientPosition.longitude);
    //   //debuging
    //   print(
    //       "DEBUGGIGN=> ${_geocodingService.getStreetNumber()},${_geocodingService.getStreetRoute()},${_geocodingService.getCity()},${_geocodingService.getSubLocality()},${_geocodingService.getCountry()}, ");
    // }
    // //a little dummy delay of 1 second
    // await Future.delayed(Duration(seconds: 1));
    // getSignCode();
    // print('Login State: ${authDataService.isLogin}');
    // // getOnBoardings();
    // switch (authDataService.onBoardingStatus) {
    //   case 'onBoarding_1':
    //     print('onBoarding_1');
    //     Get.to(OnBoardingScreen(0));
    //     return;
    //   case 'onBoarding_2':
    //     print('onBoarding_2');
    //     Get.to(OnBoardingScreen(1));
    //     return;
    //   default:
    //     break;
    // }
    // if (authDataService.isLogin) {
    //   /// Now check if token is valid or not. If expired
    //   /// then generate a new token.
    //   /// If refresh is invalid as well, then navigate user to login screen
    //   final isTokenValid =
    //       await _dbService.verifyToken(authDataService.accessToken);
    //   if (!isTokenValid) {
    //     print('Access token is invalid');
    //     final RefreshTokenBody body =
    //         await _dbService.refreshToken(authDataService.refreshToken);
    //     if (!body.status) {
    //       print('Refresh token is invalid');
    //       await _dbService.logout();
    //       Get.off(LoginScreen());
    //       return;
    //     }
    //   }

    //   /// If token is valid, it means user is logged in.
    //   /// Just navigate to Root screen
    //   print('Token is valid');
    //   Get.off(RootScreen());
    // } else {
    //   Get.off(LoginScreen());
    // }
  }

//   getOnBoardings() {
//     switch (authDataService.onBoardingStatus) {
//       case 'onBoarding_1':

//         /// Go to first onboarding screen1
//         Get.to(OnBoardingScreen(0));
//         return;
//       case 'onBoarding_2':

//         /// Go to first onboarding screen2
//         Get.to(OnBoardingScreen(1));
//         return;
//       default:
//         break;
//     }
//   }

//   getSignCode() async {
// //    final signCode = await SmsAutoFill().getAppSignature;
// //    print("sign code $signCode");
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: ExactAssetImage(
            '$assets/bg_splash.png',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///
            ///app logo of value stories
            ///
            SizedBox(
              height: 162.h,
            ),
            ImageContainer(
              assetImage: "$assets/logo.png",
              height: 159.h,
              width: 412.w,
            ),

            ///
            ///App Name HEADING
            ///
            ///
            SizedBox(height: 12.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Value Stories",
                  style: TextStyle(
                      fontFamily: "Leiko", fontSize: 34, color: Colors.black),
                ),
                SizedBox(height: 4.h),
                Text(
                  "7 Values of the Modern World",
                  style: TextStyle(
                      fontFamily: "Leiko", fontSize: 16, color: Colors.black),
                ),
              ],
            ),

            SizedBox(height: 204.h),

            ///
            ///Tripmate like loader
            ///
            SpinKitDoubleBounce(
              color: Color(0XFFA3B9DF).withOpacity(0.2),
              size: 50.0,
              controller: AnimationController(
                  duration: const Duration(milliseconds: 1400), vsync: this),
            ),
          ],
        ),
      ),
    );
  }
}
