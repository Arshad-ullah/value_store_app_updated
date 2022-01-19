import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/custom-text-field.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
import 'package:value_stories_app/ui/screens/auth_registration/forgot_password/forgot-password-view-model.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordViewModel(),
      child: Consumer<ForgotPasswordViewModel>(
        builder: (context, model, child) => UtilityBaseScreen(
          bodyTopPadding: 160,
          appBarChild: _topAppBar(),

          ///
          ///body starts from here rora
          ///
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ///
                  ///recovery illustration
                  ///
                  recoveryIllustration(),

                  ///
                  ///create account heading and subtitle
                  ///
                  heading(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 34,
                      right: 34,
                    ),
                    child: Column(
                      children: [
                        ///

                        ///Email form textfield

                        ///

                        emailTextfield(model),

                        ///

                        ///Recovery  button

                        ///

                        recoverButton(ontap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Get.back();
                          }
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///signUpLogo illustration
  ///
  recoveryIllustration() {
    return Padding(
      padding: const EdgeInsets.only(top: 36, bottom: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageContainer(
            assetImage: "assets/static_assets/pass_recover.png",
            height: 284.55.h, //260,
            width: 295.46.w, //271,
          )
        ],
      ),
    );
  }

  ///
  ///create account heading and subtitle
  ///
  heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Forgot Password",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 36.sp,
                fontWeight: FontWeight.bold)),
        Text(
          "Enter your email to recover your password",
          style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 16.sp,
              // fontWeight: FontWeight.w600,
              color: greyColor),
        ),
      ],
    );
  }

  ///
  ///RegistrationForm
  ///
  emailTextfield(ForgotPasswordViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField2(
              inputType: TextInputType.emailAddress,
              validator: (value) =>
                  value.toString().isEmail ? null : "Check your email",

              // (value) {
              //   if (value.isEmpty) {
              //     return "Please fill the field";
              //   } else {
              //     return null;
              //   }
              // },

              // controller: TextEditingController(),
              errorText: "Invalid Email",
              hintText: "E-MAIL",
              suffixIcon: IconButton(
                icon: Icon(Icons.mail,
                    size: 20, color: mainThemeColor.withOpacity(0.6)),
                onPressed: () {},
              ),
              onSaved: (value) {
                // model.loginBody.email = value.toString();
              }),
          SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }

  ///
  ///recover button
  ///
  recoverButton({ontap}) {
    return Padding(
      padding: const EdgeInsets.only(
        // top: 50,
        bottom: 42.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 262.w,
            child: RoundedRaisedButton(
              buttonText: "Recover Password",
              color: mainThemeColor,
              onPressed: ontap,
            ),
          )
        ],
      ),
    );
  }

  // login with other social media networks Or If dont have an account then signUP
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
        Text('',
            // "Value Stories",
            style: leikoHeadingTextStyle.copyWith(
              fontSize: 26.sp,
              color: Colors.white,
              // fontWeight: FontWeight.bold
            )),
        Container(width: 20.sp)
      ],
    );
  }
}
