import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';

class UtilityBaseScreen extends StatelessWidget {
  final appBarChild;
  final body;
  final double appBarContainerHeight;
  final double bodyTopPadding;
  final Widget? fab;
  UtilityBaseScreen(
      {this.appBarChild,
      this.body,
      this.fab,
      this.appBarContainerHeight = 300,
      this.bodyTopPadding = 158.5});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      ///
      ///[body] Starts from here
      ///
      body: Stack(
        children: [
          ///
          ///custom appbar
          ///
          Container(
            height: this.appBarContainerHeight.h,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: redThemeColor,
                image: DecorationImage(
                    image: ExactAssetImage(
                      '$assets/bg_appbar.png',
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 14, right: 34, top: (Get.statusBarHeight.h - 12.h)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //app bar body
                  appBarChild,
                ],
              ),
            ),
          ),

          ///
          ///body container
          ///
          Column(
            children: [
              SizedBox(
                height: this.bodyTopPadding.h,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36.0.r),
                          topRight: Radius.circular(36.0.r),
                        )),
                    child: body),
              )
            ],
          )
        ],
      ),

      ////
      ///fab
      ///
      floatingActionButton: fab,
    );
  }
}
