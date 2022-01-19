// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:value_stories_app/core/constants/colors.dart';
// import 'package:value_stories_app/core/constants/screen-utils.dart';
// import 'package:value_stories_app/core/constants/strings.dart';
// import 'package:value_stories_app/core/constants/textstyle.dart';
// import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
// import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
// import 'package:value_stories_app/ui/screens/auth_registration/login/login-screen.dart';
// import 'package:value_stories_app/ui/screens/home/home-screen.dart';

// ///
// ///this screen is for asking user either a guest or a new user
// ///
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//         ///
//         ///[body] starts from here
//         ///
//         body: Padding(
//       padding: EdgeInsets.only(top: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           ///
//           ///heading of welcome
//           ///
//           Text(
//             "Welcome",
//             style: leikoHeadingTextStyle.copyWith(fontSize: 40.sp),
//           ),

//           ///
//           ///app logo bigger
//           ///
//           appLogo(),

//           ///
//           ///heading
//           ///
//           Text(
//             "Value Stories",
//             style: leikoHeadingTextStyle.copyWith(fontSize: 34.sp),
//           ),

//           ///
//           ///Button for next screens
//           ///
//           buttons(onImNewPressed: () {
//             Get.to(() => HomeScreen());
//           }, onIhaveBeenHerePressed: () {
//             Get.to(() => LoginScreen());
//           })
//         ],
//       ),
//     ));
//   }

//   appLogo() {
//     return ImageContainer(
//       assetImage: "$assets/logo1.png",
//       height: 212.h,
//       width: 412.h,
//     );
//   }

//   buttons({onImNewPressed, onIhaveBeenHerePressed}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         //first button
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RoundedRaisedButton(
//               buttonText: "Im new",
//               onPressed: onImNewPressed,
//               color: mainThemeColor,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RoundedRaisedButton(
//               buttonText: "Ive been here",
//               onPressed: onIhaveBeenHerePressed,
//               color: subMainThemeColor,
//             ),
//           ],
//         ),

//         //second button
//       ],
//     );
//   }
// }
