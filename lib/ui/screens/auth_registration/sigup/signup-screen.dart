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
import 'package:value_stories_app/ui/screens/auth_registration/login/login-view-model.dart';
import 'package:value_stories_app/ui/screens/auth_registration/sigup/signup-view-model.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
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
                      'Create a new Account',
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
                        ///Signup button
                        ///
                        signUpButton(ontap: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            try {
                              setState(() {
                                loading = true;
                              });
                              await model.signUpWithEmailPassword(
                                  model.userEmail,
                                  model.password,
                                  model.userName);
                            } catch (signUpError) {
                              showDialog(
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(18.0),
                                            side: BorderSide(
                                              color: Colors.red[400]!,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///form having email and password text fiields
  loginForm(SignUpViewModel model, context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 34,
        right: 34.0,
      ),
      child: Column(children: [
        ///  //email textfield
        CustomTextField2(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Check your UserName",

            // (value) {
            //   if (value.isEmpty) {
            //     return "Please fill the field";
            //   } else {
            //     return null;
            //   }
            // },

            // controller: TextEditingController(),
            errorText: "Invalid UserName",
            hintText: "USERNAME",
            controller: model.userName,
            suffixIcon: IconButton(
              icon: Icon(Icons.person,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),

        SizedBox(
          height: 18.h,
        ),
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
            controller: model.userEmail,
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
            }
            // if (model.pswrdCtrlr.text != model.cnfrmPswrdCtrlr.text) {
            //   return "Your password doesnt match";
            // }
            else {
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

        SizedBox(
          height: 18.h,
        ),
        CustomTextField2(
          controller: model.confirmPassword,
          obscure: model.isConfirmPasswordVisible,
          validator: (value) {
            if (value.isEmpty) {
              return "Please fill the field";
            }
            if (value.length < 7) {
              return "The password is too short";
            }

            if (model.confirmPassword.text != model.password.text) {
              return "Your password doesnt match";
            } else {
              return null;
            }
          },

          // controller: TextEditingController(),
          errorText: "Invalid Password",
          hintText: "CONFIRM PASSWORD",
          suffixIcon: IconButton(
            icon: Icon(
                model.isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 20,
                color: mainThemeColor.withOpacity(0.6)),
            onPressed: () {
              model.setConfirmPasswrdVisibility();
            },
          ),
          onSaved: (value) {
            // model.loginBody.password = value.toString();
          },
        ),
      ]),
    );
  }

  ///
  ///signUpButton
  ///
  signUpButton({ontap}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 42.0,
      ),
      child: loading
          ? Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 262.w,
                  child: RoundedRaisedButton(
                    buttonText: "SIGNUP",
                    color: mainThemeColor,
                    onPressed: ontap,
                  ),
                )
              ],
            ),
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
              fontSize: 26.sp,
              color: Colors.white,
              // fontWeight: FontWeight.bold
            )),
        Container(width: 20.sp)
      ],
    );
  }
}
