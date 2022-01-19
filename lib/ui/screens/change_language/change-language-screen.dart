import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/core/enums/view-state.dart';
import 'package:value_stories_app/core/models/languages.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/screens/change_language/change-language-view-model.dart';

class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeLanguageViewModel>(
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
        backgroundColor: backgroundColor,

        ///
        ///body is here
        ///
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///
            ///App bar custom one
            ///
            customAppBar(),

            ///
            ///language list /Locale list
            ///
            availableLocales(model),
          ],
        ),
      )),
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
          Text("Select Language ",
              style: leikoHeadingTextStyle.copyWith(
                fontFamily: 'OPenSans',
                fontSize: 22.sp,
                color: Colors.black, // Colors.white,
                // fontWeight: FontWeight.bold
              )),
          Container(width: 50.sp)
        ],
      ),
    );
  }

  ///
  ///language list /Locale list
  ///
  availableLocales(ChangeLanguageViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 47.0),
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return localeTile(
                locale: model.locales[index],
                ontap: () {
                  for (int i = 0; i < model.locales.length; i++) {
                    if (i == index) {
                      model.locales[i].isSelected = true;
                    } else {
                      model.locales[i].isSelected = false;
                    }
                  }
                  model.setState(ViewState.loading);
                });
          }),
    );
  }

  localeTile({Language? locale, ontap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 74.h,
          color: locale!.isSelected
              ? Color(0XFF8AD6BF).withOpacity(0.2)
              : Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                ImageContainer(
                  assetImage: locale.imgUrl,
                  height: 40.h,
                  width: 40.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    locale.languageName,
                    style: bodyTextStyle.copyWith(fontSize: 18.sp),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
