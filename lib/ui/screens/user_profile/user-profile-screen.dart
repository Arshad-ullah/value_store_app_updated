import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-screen.dart';
import 'package:value_stories_app/ui/screens/user_profile/edit_profile/edit-profile-screen.dart';

class UserProfleScreen extends StatefulWidget {
  @override
  _UserProfleScreenState createState() => _UserProfleScreenState();
}

class _UserProfleScreenState extends State<UserProfleScreen> {
  String dropdownValue = "EN";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,

        ///
        ///[body] starts from here
        ///
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///
              ///heading of my profile screen
              ///
              customAppBar(),

              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 75.h,
                    ),

                    ///
                    ///profileavatar and edit profile button sections
                    ///
                    profileAvatarSection(),

                    ///
                    ///profile setting tile list
                    ///
                    profileSettingTileList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          Text("Account",
              style: leikoHeadingTextStyle.copyWith(
                fontSize: 24.sp,
                fontFamily: 'OPenSans',
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

  ///
  ///profileavatar and edit profile button sections
  ///
  profileAvatarSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //avatar
          Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(image: AssetImage("$assets/user.png"))),
          ),
          //profilename and email

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 6.0),
            child: Text(
              userDetails!.username,
              style: headingTextStyle.copyWith(fontSize: 15, letterSpacing: 0),
            ),
          ),
          Text(
            userDetails!.email,
            style: subBodyTextStyle.copyWith(
                color: Colors.grey, letterSpacing: 0, fontSize: 13),
          ),
          //edit profiel button
          // Padding(
          //   padding: const EdgeInsets.only(top: 24, bottom: 33.5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       editProfileButton(onPressed: () {
          //         print('@edit button pressed');

          //         Get.to(() => EditProfileScreen());
          //       })
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 33, right: 33.0),
            child: Divider(
              color: greyColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  editProfileButton({onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: 35.h,
        // width: 125.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 8, // has the effect of softening the shadow
              spreadRadius: 1.2, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0.4, // vertical, move down 10
              ),
            ),
          ],
          color: mainThemeColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
              child: Text(
                "Edit profile",
                style: headingTextStyle.copyWith(
                  fontSize: 17.sp,
                  letterSpacing: 0.6,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///profile setting tile list
  ///
  profileSettingTileList() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileSettingTile(
              title: "Help and Support",
              ontap: () {
                // Get.to(() => HelpAndSupportScreen());
              }),
          profileSettingTile(
              title: "Terms and Conditions",
              ontap: () {
                // Get.to(() => TermsAndConditionScreen());
              }),
          //language tile
          Padding(
            padding:
                const EdgeInsets.only(left: 33, right: 33, bottom: 0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: bodyTextStyle.copyWith(fontSize: 16),
                ),
                //custom drop down
                Container(
                  height: 28,
                  padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius:
                              4, // has the effect of softening the shadow
                          spreadRadius:
                              1.2, // has the effect of extending the shadow
                          offset: Offset(
                            0, // horizontal, move right 10
                            0.6, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: mainThemeColor,
                      style: bodyTextStyle.copyWith(
                          color: Colors.white, letterSpacing: 0, fontSize: 16),
                      value: dropdownValue,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                      ),
                      elevation: 0,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();
                        });
                      },
                      items: <String>['EN', '']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: bodyTextStyle.copyWith(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontSize: 16.sp),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          profileSettingTile(
              title: "Rate the app",
              ontap: () {
                // Get.to(() => HelpAndSupportScreen());
              }),
          //change password tile
          // InkWell(
          //   onTap: () {
          //     // Get.to(() => ResetPasswordScreen());
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         bottom: 10, top: 17, left: 33, right: 33),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             ImageContainer(
          //                 assetImage: "$assets/padlock.png",
          //                 height: 12.66.h,
          //                 width: 9.49.w),
          //             SizedBox(width: 15.5),
          //             Text("Change Password",
          //                 style: bodyTextStyle.copyWith(
          //                     color: mainThemeColor,
          //                     fontSize: 16.sp,
          //                     letterSpacing: 0)),
          //           ],
          //         ),
          //         Container(),
          //       ],
          //     ),
          //   ),
          // ),
          //logouttile

          InkWell(
            onTap: () async {
              Get.offAll(() => LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 27.0 / 2, top: 17, left: 33, right: 33),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageContainer(
                          assetImage: "$assets/logout.png",
                          height: 9.31.h,
                          width: 12.13.w),
                      SizedBox(width: 15.5),
                      Text(
                        "Logout",
                        style: bodyTextStyle.copyWith(
                            color: Color(0XFF6287C8),
                            fontSize: 16,
                            letterSpacing: 0),
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  profileSettingTile({title, ontap}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 27.0 / 2, top: 27 / 2, left: 33, right: 33),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$title",
              style: bodyTextStyle.copyWith(fontSize: 16),
            ),
            ImageContainer(
              assetImage: "$assets/ios_forward.png",
              height: 8.54.h,
              width: 5.w,
            )
          ],
        ),
      ),
    );
  }
}
