// import 'dart:io';

// import 'package:ebuddy_networking_app/core/constants/colors.dart';
// import 'package:ebuddy_networking_app/core/constants/dimensions.dart';
// import 'package:ebuddy_networking_app/core/constants/strings.dart';
// import 'package:ebuddy_networking_app/ui/custom_widgets/image-container.dart';
// import 'package:ebuddy_networking_app/ui/screens/conversation/conversation-screen.dart';
// import 'package:ebuddy_networking_app/ui/screens/home/home-screen.dart';
// import 'package:ebuddy_networking_app/ui/screens/home/posts/creat_post/creat-post-screen.dart';
// import 'package:ebuddy_networking_app/ui/screens/notifications/notification-screen.dart';
// import 'package:ebuddy_networking_app/ui/screens/user_profile/user-profile-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_statusbar/flutter_statusbar.dart';
// import 'package:get/get.dart';

// import '../../main.dart';

// ///
// ///This is a [root-screen] of app for integrating the bottom-navigation bar and showing other screens
// ///
// class RootScreen extends StatefulWidget {
//   final int index;
//   RootScreen({this.index = 0});
//   @override
//   _RootScreenState createState() => _RootScreenState();
// }

// class _RootScreenState extends State<RootScreen> {
//   /// or accessing selected bottom navigation bar item
//   var selectedIndex = 0;

//   ///for putting a list of screens to bottom naviagtion bar childrens
//   List<Widget> bottomAppBarScreens = <Widget>[
//     HomeScreen(),
//     ConversationScreen(),
//     Container(),
//     NotificationScreen(),
//     UserProfileScreen()
//   ];
//   double _height;
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();

//     selectedIndex = widget.index;
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   initPlatformState() async {
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       _height = await FlutterStatusbar.height;
//       StatuBarHeight.height = _height;
//       print("Height of status bar is ==> ${StatuBarHeight.height}");
//     } on PlatformException {}

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onBackPressed,
//       child: Scaffold(
//         backgroundColor: mainThemeColor,

//         ///
//         ///passing my all [screens] in root screen body
//         ///
//         body: bottomAppBarScreens.elementAt(selectedIndex),

//         ///
//         ///[BNB] bottom navigation bar for multiple screen access from dashboard
//         ///
//         bottomNavigationBar: Container(
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               blurRadius: 18, // has the effect of softening the shadow
//               spreadRadius: 4.2, // has the effect of extending the shadow
//               offset: Offset(
//                 0, // horizontal, move right 10
//                 0.4, // vertical, move down 10
//               ),
//             )
//           ]),
//           child: ConvexAppBar(
//             elevation: 0,
//             height: 60,
//             top: -29,
//             curveSize: 100,
//             backgroundColor: Colors.white,
//             color: Colors.white,
//             style: TabStyle.fixedCircle,
//             items: [
//               TabItem(
//                 icon: ImageContainer(
//                   assetImage: selectedIndex == 0
//                       ? "assets/static_assets/bottom-nav-bar/home1.png"
//                       : "assets/static_assets/bottom-nav-bar/home0.png",
//                   height: 18.33.h,
//                   width: 21.66.w,
//                 ),
//               ),
//               TabItem(
//                 icon: ImageContainer(
//                   assetImage: selectedIndex == 1
//                       ? "assets/static_assets/bottom-nav-bar/messenger1.png"
//                       : "assets/static_assets/bottom-nav-bar/messenger0.png",
//                   height: 18.51.h,
//                   width: 24.95.w,
//                 ),
//               ),
//               TabItem(
//                   icon: Container(
//                 // height: 40,
//                 // width: 40,
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 8, // has the effect of softening the shadow
//                     spreadRadius: 2, // has the effect of extending the shadow
//                     offset: Offset(
//                       0, // horizontal, move right 10
//                       0.4, // vertical, move down 10
//                     ),
//                   )
//                 ], shape: BoxShape.circle, color: Colors.white),
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Container(
//                       // height: 30,
//                       // width: 30,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: Image.asset(
//                         "assets/static_assets/add_post0.png",
//                         // fit: BoxFit.cover,
//                       )),
//                 ),
//                 // child: Image.asset(
//                 //   "assets/static_assets/add_post0.png",
//                 // ),
//               )),
//               TabItem(
//                 icon: ImageContainer(
//                   assetImage: selectedIndex == 3
//                       ? "assets/static_assets/bottom-nav-bar/notification1.png"
//                       : "assets/static_assets/bottom-nav-bar/notification0.png",
//                   height: 17.92.h,
//                   width: 17.w,
//                 ),
//               ),
//               TabItem(
//                 icon: ImageContainer(
//                   assetImage: selectedIndex == 4
//                       ? "assets/static_assets/bottom-nav-bar/user_profile1.png"
//                       : "assets/static_assets/bottom-nav-bar/user_profile0.png",
//                   height: 19.39.h,
//                   width: 16.94.w,
//                 ),
//               ),
//             ],
//             initialActiveIndex: 1,
//             onTap: (int i) {
//               if (i != 2) {
//                 _onItemTapped(i);
//               } else {
//                 print("Create post pressed");
//                 Get.to(() => CreatePostScreen());
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   ///
//   ///on[ backpressed] call back to avoid user interaction with splash screen
//   ///
//   Future<bool> _onBackPressed() {
//     return showDialog(
//           context: context,
//           builder: (context) => new AlertDialog(
//             title: new Text('Are you sure?'),
//             content: new Text('Do you want to exit an App'),
//             actions: <Widget>[
//               new FlatButton(
//                 textColor: mainThemeColor,
//                 onPressed: () {
//                   Navigator.of(context).pop(false);
//                   // _updateConnectionFlag(true);
//                 },
//                 child: Text(
//                   "NO",
//                 ),
//               ),
//               SizedBox(height: 16),
//               new FlatButton(
//                 textColor: mainThemeColor,
//                 onPressed: () {
//                   exit(0);
//                 },
//                 child: Text("YES"),
//               ),
//             ],
//           ),
//         ) ??
//         false;
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
// }
