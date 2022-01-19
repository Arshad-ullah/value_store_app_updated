import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:value_stories_app/locator.dart';
import 'package:provider/provider.dart';
import 'package:value_stories_app/ui/screens/about_story/about-story-screen.dart';
import 'package:value_stories_app/ui/screens/auth_registration/forgot_password/forgot-password-screen.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-screen.dart';
import 'package:value_stories_app/ui/screens/auth_registration/sigup/signup-screen.dart';
import 'package:value_stories_app/ui/screens/change_language/change-language-screen.dart';
import 'package:value_stories_app/ui/screens/change_language/change-language-view-model.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';
import 'package:value_stories_app/ui/screens/onBoarding/onboarding-screen.dart';
import 'package:value_stories_app/ui/screens/slider_details/slider-detail-screen.dart';
import 'package:value_stories_app/ui/screens/splash_screen.dart';
import 'package:value_stories_app/ui/screens/story/audible-story/audible-story-screen.dart';
import 'package:value_stories_app/ui/screens/story/story-screen.dart';
import 'package:value_stories_app/ui/screens/user_profile/edit_profile/edit-profile-screen.dart';
import 'package:value_stories_app/ui/screens/user_profile/guest-profile-screen.dart';
import 'package:value_stories_app/ui/screens/user_profile/user-profile-screen.dart';
import 'package:value_stories_app/ui/screens/welcome/welcome-screen.dart';

Future<void> main()
// async
async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // await Firebase.initializeApp();
  setupLocator();

  runApp(GetMaterialApp(
      initialRoute: '/',

    getPages: [
      GetPage(name: "/", page:()=>MyApp())
    ],
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   return ScreenUtilInit(

     builder: ()=>MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (_) => ChangeLanguageViewModel()),
          ],
       child: SplashScreen()),
         designSize: Size(412,870),

   );
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<ChangeLanguageViewModel>(create: (_) => ChangeLanguageViewModel()),
    //   ],
    //   child: ScreenUtilInit(
    //     builder: ()=>MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'text',
    //       home: SplashScreen(),
    //     ),
    //     designSize: Size(412, 870),
    //   ),// child: ScreenUtilInit(
      //   designSize: Size(412, 870),
      //   builder: () => GetMaterialApp(
      //     debugShowCheckedModeBanner: false,
      //       title:
      //           'Value Stor                                                                                                                                                                                                                                                                                        ies app',
      //       // theme: ThemeData.dark(),
      //       // theme: ThemeData(brightness: Brightness.dark),
      //       home: SplashScreen()),
      // ),


  }
}
