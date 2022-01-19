import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';

class EditProfileScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return UtilityBaseScreen(
        bodyTopPadding: 171,

        ///
        ///appbar body
        ///
        appBarChild: _topAppBar(),

        ///
        ///screen body
        ///
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///
              ///add image container
              ///
              addImage(),

              ///
              ///edit profile form
              ///
              editProfileForm(),

              ///
              ///save button
              ///
              saveButton(ontap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  Get.back();
                }
              }),
            ],
          ),
        ));
  }

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
        Text("Edit Profile",
            style: leikoHeadingTextStyle.copyWith(
                fontFamily:'OPenSans',
              fontSize: 26.sp,
              color: Colors.black,
              // fontWeight: FontWeight.bold
            )),
        Container(width: 20.sp)
      ],
    );
  }

  ///
  ///add image container
  ///
  addImage() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45.0,
        bottom: 54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 97.h,
                  width: 97.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("$assets/user.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ImageContainer(
                      assetImage: "$assets/camera.png",
                      width: 36.02.w,
                      height: 31.21.h,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ///
  ///edit profile form
  ///
  editProfileForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33.0),
      child: Form(
        key: formkey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            textfield("Username", (value) {}),
            SizedBox(
              height: 28.3.h,
            ),
            textfield("Phone", (value) {}),
            SizedBox(
              height: 28.3.h,
            ),
            textfield("Email", (value) {})
          ],
        ),
      ),
    );
  }

  textfield(
    name,
    onsaved,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$name",
              style: subBodyTextStyle.copyWith(
                  color: greyColor.withOpacity(0.6), fontSize: 12.sp),
            ),
          ],
        ),
        TextFormField(
          onSaved: onsaved,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please fill this field";
            } else {
              return null;
            }
          },
          style: subBodyTextStyle.copyWith(fontSize: 16.sp),
          decoration: InputDecoration(
              hintText: "Enter your ${name.toString().toLowerCase()}",
              contentPadding: EdgeInsets.only(top: 14)),
        )
      ],
    );
  }

  ///
  ///save button
  ///
  saveButton({ontap}) {
    return Padding(
      padding: const EdgeInsets.only(top: 84.5, bottom: 96.0),
      child: Column(
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
                    buttonText: "SAVE",
                    onPressed: ontap,
                    color: mainThemeColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
