import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/custom-text-field.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
import 'package:value_stories_app/ui/screens/auth_registration/forgot_password/forgot-password-screen.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-view-model.dart';
import 'package:value_stories_app/ui/screens/auth_registration/sigup/signup-screen.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => UtilityBaseScreen(
          appBarChild: _topAppBar(),

          ///
          ///body starts from here rora
          ///
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ///heading
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0, top: 37),
                    child: Text(
                      'Welcome !',
                      style: bHeadingTextStyle.copyWith(
                          fontSize: 28.sp, color: mainThemeColor),
                    ),
                  ),

                  //login form
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),

                        ///form having email and password text fiields
                        loginForm(model, context),

                        ///
                        ///login button
                        ///
                        loginButton(ontap: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            try {
                              setState(() {
                                loading = true;
                              });
                              await model.signInWithEmailPassword(
                                  model.userEmail, model.password);
                            } catch (signUpError) {
                              showDialog(
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(18.0),
                                            side: BorderSide(
                                              color: Colors.red.shade400,
                                            )),
                                        title: Text(signUpError.toString()),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.red[400]),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                  context: context);
                            }
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString('LoggedIn', "true");
                            setState(() {
                              loading = false;
                            });
                          }
                        }),
                      ],
                    ),
                  ),

                  // login with other social media networks Or If dont have an account then signUP
                  oRLoginWithSocial(
                      onFbPressed: () {},
                      onGooglePressed: () {},
                      onSignUpPressed: () {
                        Get.to(() => SignUpScreen());
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///form having email and password text fiields
  loginForm(LoginViewModel model, context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 34,
        right: 34.0,
      ),
      child: Column(children: [
        ///  //email textfield
        CustomTextField2(
            controller: model.userEmail,
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
          height: 18.h,
        ),
        //password textfield
        CustomTextField2(
          controller: model.password,
          obscure: model.isPasswordVisible,
          validator: (value) {
            if (value.isEmpty) {
              return "Please fill the field";
            }
            if (value.length < 7) {
              return "The password is too short";
            } else {
              return null;
            }
          },

          // controller: TextEditingController(),
          errorText: "Invalid Password",
          hintText: "PASSWORD",
          suffixIcon: IconButton(
            icon: Icon(
                model.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 20,
                color: mainThemeColor.withOpacity(0.6)),
            onPressed: () {
              model.setPasswrdVisibility();
            },
          ),
          onSaved: (value) {
            // model.loginBody.password = value.toString();
          },
        ),
        // SizedBox(
        //   height: 14.9.h,
        // ),
        Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: GestureDetector(
                onTap: () {
                  print("Forget Button pressed");
                  // Get.to(() => ForgetPasswordScreen());
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(() => ForgotPasswordScreen());
                            },
                            child: Text("Forget Password?",
                                style: subBodyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: mainThemeColor.withOpacity(0.6)))),
                      ],
                    ),
                  ],
                )))
      ]),
    );
  }

  ///
  ///login button
  ///
  loginButton({ontap}) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 42.0),
      child: loading
          ? Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 262.w,
                  child: RoundedRaisedButton(
                    buttonText: "LOGIN",
                    color: mainThemeColor,
                    onPressed: ontap,
                  ),
                )
              ],
            ),
    );
  }

  oRLoginWithSocial({
    onFbPressed,
    onGooglePressed,
    onSignUpPressed,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 55.0, right: 55),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: greyColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25.0),
                    child: Text(
                      "OR",
                      style: bodyTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 2,
                    color: greyColor,
                  )),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  onTap: onGooglePressed,
                  child: ImageContainer(
                    height: 46,
                    width: 46,
                    assetImage: "$assets/fb.png",
                  ),
                ),
                SizedBox(
                  width: 5.2.w,
                ),
                InkWell(
                  onTap: onGooglePressed,
                  child: ImageContainer(
                    height: 46,
                    width: 46,
                    assetImage: "$assets/google.png",
                  ),
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 70.5,
            bottom: 30.0,
          ),
          child: GestureDetector(
            onTap: onSignUpPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: bodyTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  "SignUp",
                  style: bodyTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: mainThemeColor),
                )
              ],
            ),
          ),
        )
      ],
    );
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
        Text('',
            // "Value Stories",
            style: leikoHeadingTextStyle.copyWith(
                fontSize: 24.sp,
                fontFamily: 'OpenSans',
                color: Colors.black, // Color(0XFFA5339F), //
                fontWeight: FontWeight.bold)),
        Container(width: 20.sp)
      ],
    );
  }
}
