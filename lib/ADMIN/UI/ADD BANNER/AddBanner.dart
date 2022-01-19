
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/AdminTextFields.dart';
import 'package:value_stories_app/ui/custom_widgets/custom-text-field.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/ui/custom_widgets/rounded-raised-button.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-view-model.dart';
import 'package:value_stories_app/ui/screens/auth_registration/sigup/signup-view-model.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';

import 'AddBannerviewModel.dart';

class AddBannerScreen extends StatefulWidget {
  @override
  _AddBannerScreenState createState() => _AddBannerScreenState();
}

class _AddBannerScreenState extends State<AddBannerScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  late DateTime _dateTime;
  DateTime selectedDate = DateTime.now();

  String? tripTime;
  String? tripTimeInDays;
  bool male = true;
  bool female = false;
  late DateTime policyEndDate;

  late File _imagePolicy;
  String paymentOption = "Card";

  bool _imagecheck = false;

  bool _picUploading = false;

  bool piccheck = false;
  bool _loading = false;

  late String _bannerPicture;

  DateTime dateOfBirth = DateTime.now();

  bool countryCodeSelected = false;
  String userAge = "0";

  //payment options
  bool card = true;
  bool cashondelivery = false;

  bool terms = false;
  DateTime policystartDate = DateTime.now();
  bool dateSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBannerScreenViewModel(),
      child: Consumer<AddBannerScreenViewModel>(
        builder: (context, model, child) => UtilityBaseScreen(
          appBarChild: _topAppBar(),

          ///
          ///body starts from here rora
          ///
          body: Stack(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///heading
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 37),
                        child: Text(
                          'Banner Details',
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
                              height: 40.h,
                            ),

                            ///form having email and password text fiields
                            loginForm(model, context),

                            ///
                            ///Signup button
                            ///
                            signUpButton(ontap: () async {
                              if (_formKey.currentState!.validate() &&
                                  _bannerPicture != null) {
                                _formKey.currentState!.save();

                                try {
                                  setState(() {
                                    loading = true;
                                  });
                                  await model.addBannerStory(
                                      _bannerPicture,
                                      model.motivationalText,
                                      model.value1,
                                      model.value2,
                                      model.value3,
                                      model.value4,
                                      model.value5,
                                      model.value6,
                                      model.value7,
                                      model.importance,
                                      model.aboutUs);
                                } catch (signUpError) {
                                  showDialog(
                                      builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                     BorderRadius.circular(
                                                        18.0),
                                                side: BorderSide(
                                                  color: (Colors.red[400])!,
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
                                var prefs =
                                    await SharedPreferences.getInstance();
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
              _picUploading
                  ? Container(
                      height: 1.sh,
                      width: 1.sw,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: 0,
                      width: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }

  ///form having email and password text fiields
  loginForm(AddBannerScreenViewModel model, context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 34,
        right: 34.0,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Banner Picture',
            style: bHeadingTextStyle.copyWith(
                fontSize: 22.sp, color: Colors.black),
          ),
        ),
        InkWell(
          child: Container(
            height: 112,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // color: blueThemeColor,
                borderRadius: BorderRadius.circular(10.0.r),
                color: Colors.grey[300]),
            child: _bannerPicture != null
                ? ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      image: NetworkImage(_bannerPicture),
                      width: MediaQuery.of(context).size.width,
                      height: 112,
                      fit: BoxFit.fill,
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_camera,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
          ),
          onTap: () async {
            _imagePolicy = await pickImage(context, ImageSource.gallery);
            setState(() {
              piccheck = true;
            });
            if (_imagePolicy != null) {
              print("HII");
              setState(() {
                _picUploading = true;
              });
              final  _storgae = FirebaseStorage.instance;
                //  storageBucket: 'gs://insurance-app-515f9.appspot.com');
              print("HII");
              UploadTask uploadTask;
              String filePath = '${DateTime.now()}.png';
              uploadTask = _storgae.ref().child(filePath).putFile(_imagePolicy);
              uploadTask.then((_) async {
                print(1);
                String url1 =
                    await uploadTask.snapshot.ref.getDownloadURL();
                _imagePolicy.delete().then((onValue) {
                  print(2);
                });
                setState(() {
                  _imagecheck = true;
                  _picUploading = false;
                });
                print(url1);

                _bannerPicture = url1;
              });
            }
          },
        ),

        SizedBox(
          height: 28.h,
        ),

        ///  //email textfield
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Motivation Text',
            style: bHeadingTextStyle.copyWith(
                fontSize: 22.sp, color: Colors.black),
          ),
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Invalid UserName",
            hintText: "Motivation Text",
            controller: model.motivationalText,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),

        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Seven Values',
            style: bHeadingTextStyle.copyWith(
                fontSize: 22.sp, color: Colors.black),
          ),
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 1",
            controller: model.value1,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),
        SizedBox(
          height: 18.h,
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 2",
            controller: model.value2,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),
        SizedBox(
          height: 18.h,
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 3",
            controller: model.value3,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),
        SizedBox(
          height: 18.h,
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 4",
            controller: model.value4,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),
        SizedBox(
          height: 18.h,
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 5",
            controller: model.value5,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),
        SizedBox(
          height: 18.h,
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 6",
            controller: model.value6,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),
        SizedBox(
          height: 18.h,
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Field Must not be empty",
            hintText: "Value 7",
            controller: model.value7,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),

        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Importance',
            style: bHeadingTextStyle.copyWith(
                fontSize: 22.sp, color: Colors.black),
          ),
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Invalid UserName",
            hintText: "Importance Text",
            controller: model.importance,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),

        SizedBox(
          height: 18.h,
        ),
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'About Us',
            style: bHeadingTextStyle.copyWith(
                fontSize: 22.sp, color: Colors.black),
          ),
        ),
        AdminCustomTextField(
            inputType: TextInputType.emailAddress,
            validator: (value) =>
                value.toString().isNotEmpty ? null : "Field Must not be empty",
            errorText: "Invalid UserName",
            hintText: "About Us Text",
            controller: model.aboutUs,
            suffixIcon: IconButton(
              icon: Icon(Icons.edit,
                  size: 20, color: mainThemeColor.withOpacity(0.6)),
              onPressed: () {},
            ),
            onSaved: (value) {
              // model.loginBody.email = value.toString();
            }),

        SizedBox(
          height: 18.h,
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
                    buttonText: "Add Banner",
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

Future<File> pickImage(BuildContext context, ImageSource source) async {
  File selected = (await ImagePicker.platform.pickImage(
    source: source,
    imageQuality: 20,
  )) as File;
  return selected;
}
