import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:simple_html_css/simple_html_css.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/screens/story/audible-story/audible-story-screen.dart';
import 'package:value_stories_app/ui/screens/story/story-view-model.dart';

class StoryScreen extends StatefulWidget {
  // Story story;
  // StoryScreen(this.story);
  final dynamic storyDetails;
  StoryScreen(this.storyDetails);
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoryViewModel(context),
      child: Consumer<StoryViewModel>(builder: (context, model, child) {
        ///
        ///then return the build
        ///
        return SafeArea(
          child: Scaffold(
            backgroundColor:
                model.isDarkMode ? Color(0XFF121212) : backgroundColor,

            ///
            ///body is here
            ///
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ///
                  ///App bar custom one
                  ///
                  customAppBar(),

                  ///
                  ///Story content in html viewwer
                  ///
                  storyHtmlViewer(model)
                ],
              ),
            ),

            ///
            ///bottom bar for utility features
            ///

            bottomNavigationBar: bottomBar(model),
          ),
        );
      }),
    );
  }

  ///
  ///Story content in html viewwer
  ///
  storyHtmlViewer(StoryViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 12.0, right: 12.0, top: 20.0, bottom: 20.0),
      child: Container(
        color: model.isDarkMode ? Color(0XFF121212) : Colors.white,
        child: Column(
          children: [
            ////
            ///LIKE UNLIKE BUTTON
            ///
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, left: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.storyDetails["StoryTitle"],
                          textAlign: model.textAlignment,
                          style: headingTextStyle.copyWith(
                              color: model.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: model.isLargeText ? 32.sp : 26.sp),
                        ),
                        SizedBox(
                          height: 12.8,
                        ),
                        Text(
                          "by " + widget.storyDetails["StoryWriter"],
                          textAlign: model.textAlignment,
                          style: headingTextStyle.copyWith(
                              color: model.isDarkMode
                                  ? Colors.white.withOpacity(0.6)
                                  : Colors.grey.withOpacity(0.6),
                              fontSize: model.isLargeText ? 24.sp : 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        userDetails!.likedStories.add(
                            widget.storyDetails["StoryTitle"] +
                                widget.storyDetails["StoryWriter"]);
                      });

                      FirebaseFirestore.instance
                          .collection("Users List")
                          .doc(userDetails!.userDocid)
                          .update({"LikedStories": userDetails!.likedStories});
                    },
                    child: userDetails == null
                        ? Container()
                        : ImageContainer(
                            assetImage: userDetails!.likedStories.contains(widget
                                            .storyDetails["StoryTitle"] +
                                        widget.storyDetails["StoryWriter"]) ==
                                    true
                                ? '$assets/like.png'
                                : model.isDarkMode
                                    ? '$assets/unlike_dark.png'
                                    : '$assets/unlike.png',
                            height: 50.h,
                            width: 50.w,
                          ),
                  ),
                  // IconButton(
                  //     icon: ImageContainer(
                  //       assetImage:
                  //           isLiked ? '$assets/like.png' : '$assets/unlike.png',
                  //       height: 505.h,
                  //       width: 50.w,
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         isLiked = !isLiked;
                  //       });
                  //     })
                ],
              ),
            ),

            Divider(),
            ////
            ///HTML CONTENT RENDERER
            ///

            //here are the changes

            // Html(
            //   shrinkWrap: true,
            //   data: model.htmlData,
            //   style: {
            //     'h1': Style(
            //         textAlign: model.textAlignment,
            //         // textOverflow: TextOverflow.ellipsis,
            //         fontFamily: 'OpenSans',
            //         color: model.isDarkMode ? Colors.white : Colors.black,
            //         fontSize:
            //             model.isLargeText ? FontSize(32.sp) : FontSize(26.sp)),

            //     'h5': Style(
            //         // maxLines: 2,
            //         textAlign: model.textAlignment,
            //         // textOverflow: TextOverflow.ellipsis,
            //         color: model.isDarkMode
            //             ? Colors.white.withOpacity(0.6)
            //             : Colors.grey.withOpacity(0.6),
            //         fontSize:
            //             model.isLargeText ? FontSize(24.sp) : FontSize(16.sp),
            //         fontFamily: 'OpenSans'),
            //     'p': Style(
            //         // lineHeight: model.isHeightedTex ? LineHeight(2) : null,
            //         textAlign: model.textAlignment,
            //         color: model.isDarkMode ? Colors.white : Colors.black,
            //         fontSize:
            //             model.isLargeText ? FontSize(26.sp) : FontSize(20.sp),
            //         fontFamily: 'OpenSans'),
            //     // 'p': Style(
            //     //     textOverflow: TextOverflow.ellipsis, fontSize: FontSize(20.sp)),
            //   },
            //   //   onLinkTap: (url, _, __, ___) {
            //   //     print("Opening $url...");
            //   //   },
            //   // onImageTap: (src, _, __, ___) {
            //   //   print("ZAMA IMAGE $src");
            //   // },
            //   //   onImageError: (exception, stackTrace) {
            //   //     print(exception);
            //   //   },
            // ),
          ],
        ),
      ),
    );
  }

  bottomBar(StoryViewModel model) {
    return Container(
      height: 70.0.h,
      decoration: BoxDecoration(
          color: model.isDarkMode ? Color(0XFF121212) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8, // has the effect of softening the shadow
              spreadRadius: 1.2, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0.4, // vertical, move down 10
              ),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: ImageContainer(
                  assetImage:
                      model.isDarkMode ? '$assets/sun.png' : '$assets/moon.png',
                  height: 28.h,
                  width: 28.w,
                ),
                onPressed: () {
                  debugPrint('dark mode pressed');
                  model.setDarkMode();
                }),
            IconButton(
                icon: ImageContainer(
                  assetImage: model.isDarkMode
                      ? '$assets/bold_text0.png'
                      : '$assets/bold_text.png',
                  height: 28.h,
                  width: 28.w,
                ),
                onPressed: () {
                  debugPrint('bold text mode pressed');
                  model.setLargeText();
                }),
            // IconButton(
            //     icon: ImageContainer(
            //       assetImage: model.isDarkMode
            //           ? '$assets/text_height0.png'
            //           : '$assets/text_height.png',
            //       height: 24.h,
            //       width: 24.w,
            //     ),
            //     onPressed: () {
            //       debugPrint('text height mode pressed');
            //       model.setHeightedText();
            //     }),
            IconButton(
                icon: Icon(
                  Icons.wrap_text_rounded,
                  size: 24,
                  color: model.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  debugPrint('text height mode pressed');
                  switch (model.textAlignment) {
                    case TextAlign.left:
                      model.setTextAdjusment(TextAlign.right);
                      return;
                    case TextAlign.right:
                      model.setTextAdjusment(TextAlign.center);
                      return;
                    case TextAlign.center:
                      model.setTextAdjusment(TextAlign.justify);
                      return;

                    case TextAlign.justify:
                      model.setTextAdjusment(TextAlign.left);
                      return;

                    default:
                      model.setTextAdjusment(TextAlign.left);
                  }
                }),
          ],
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
          Text("",
              // "Value Stories",
              style: leikoHeadingTextStyle.copyWith(
                fontSize: 26.sp,
                color: Colors.white,
                // fontWeight: FontWeight.bold
              )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                padding: EdgeInsets.zero,
                icon: ImageContainer(
                  assetImage: "$assets/audio.png",
                  height: 34.18.h,
                  width: 34.w,
                ),
                onPressed: () {
                  print('audio pressed');
                  // Get.back();
                  Get.to(() => AudibleStoryScreen(widget.storyDetails));
                }),
          ),
        ],
      ),
    );
  }
}
