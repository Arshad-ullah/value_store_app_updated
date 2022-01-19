import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_stories_app/Payment/PaymnetMain.dart';
import 'package:value_stories_app/core/constants/backendVariables.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/ui/screens/about_story/about-story-screen.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-screen.dart';
import 'package:value_stories_app/ui/screens/auth_registration/sigup/signup-screen.dart';
import 'package:value_stories_app/ui/screens/home/home-screen.dart';
import 'package:value_stories_app/ui/screens/story/story-screen.dart';

class StoryTile extends StatefulWidget {
  final int index;
  final dynamic storyDetails;
  StoryTile(this.index, this.storyDetails);

  @override
  _StoryTileState createState() => _StoryTileState();
}

class _StoryTileState extends State<StoryTile> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    ///for now i done this for dummy purpose using inddex but the same scenario will be for STORY object u have to just check
    ///a boolan value like isLocked and then done things something like this
    ///   story.isLocked ? buildLockedStoryTile() : buildStoryTile();
    return widget.index < 2
        ? buildStoryTile()
        : stroiesLock
            ? buildLockedStoryTile()
            : buildStoryTile();
  }

  ///
  ///This tile is shown when the story is open in a trial mode
  ///
  buildStoryTile() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 30, right: 30),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8, // has the effect of softening the shadow
                      spreadRadius:
                          1.2, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        0.4, // vertical, move down 10
                      ),
                    ),
                  ]),
              child: Row(
                children: [
                  //FIRT COMPONENET
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 14),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => StoryScreen(widget.storyDetails));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.network(
                          widget.storyDetails["StoryCoverPic"],
                          fit: BoxFit.cover,
                          height: 141.h,
                          width: 92.h,
                        ),
                      ),
                    ),
                  ),

                  ///
                  ///second componenet
                  ///
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              widget.storyDetails["StoryTitle"],
                              style: bodyTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            )),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5.0, bottom: 31.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "By " + widget.storyDetails["StoryWriter"],
                                style: subBodyTextStyle.copyWith(
                                    fontSize: 12.sp,
                                    color: greyColor.withOpacity(1),
                                    fontWeight: FontWeight.w600),
                              )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('read Story pressed');
                                Get.to(() => StoryScreen(widget.storyDetails));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 4),
                                // height: 22.h,
                                // width: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0.r),
                                  color: Color(0XFF6C9FCE),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Read",
                                      style: subBodyTextStyle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  //Third componenet
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 24),
                    child: GestureDetector(
                      onTap: () {
                        print(
                            "Value discovery of story ${widget.index} pressed");

                        Get.to(() => AboutStoryScreen(widget.storyDetails));
                      },
                      child: Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: mainThemeColor,
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Value\nDiscovery",
                                textAlign: TextAlign.center,
                                style: leikoHeadingTextStyle.copyWith(
                                    fontSize: 14.sp, color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///
            ///LIKE UNLINE BUTTON
            ///
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
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
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10.0),
                        child: Container(
                          child: ImageContainer(
                            assetImage: userDetails!.likedStories.contains(widget
                                            .storyDetails["StoryTitle"] +
                                        widget.storyDetails["StoryWriter"]) ==
                                    true
                                ? '$assets/heart0.png'
                                : '$assets/heart1.png',
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

////
  ///
  ///This tile will be shown when the story is locked only
  ///
  ///
  buildLockedStoryTile() {
    return Stack(
      children: [
        //first widget
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8, // has the effect of softening the shadow
                    spreadRadius: 1.2, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      0.4, // vertical, move down 10
                    ),
                  ),
                ]),
            child: Row(
              children: [
                //FIRT COMPONENET
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 14),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => StoryScreen(widget.storyDetails));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(
                        widget.storyDetails["StoryCoverPic"],
                        fit: BoxFit.cover,
                        height: 141.h,
                        width: 92.h,
                      ),
                    ),
                  ),
                ),

                ///
                ///second componenet
                ///
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            widget.storyDetails["StoryTitle"],
                            style: bodyTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 31.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "By " + widget.storyDetails["StoryWriter"],
                              style: subBodyTextStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: greyColor.withOpacity(1),
                                  fontWeight: FontWeight.w600),
                            )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('read Story pressed');
                              Get.to(() => StoryScreen(widget.storyDetails));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 4),
                              // height: 22.h,
                              // width: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0.r),
                                color: Color(0XFF6C9FCE),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Read",
                                    style: subBodyTextStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: backgroundColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                //Third componenet
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 24),
                  child: GestureDetector(
                    onTap: () {
                      print("Value discovery of story ${widget.index} pressed");

                      Get.to(() => AboutStoryScreen(widget.storyDetails));
                    },
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: mainThemeColor,
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Value\nDiscovery",
                              textAlign: TextAlign.center,
                              style: leikoHeadingTextStyle.copyWith(
                                  fontSize: 14.sp, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //opaque widget
        ////I just build this widget for a purpose of responsive  i can also done it with a simple container having fixed height but no
        ///in order to make it responsive we have to create a top layer above this tile which will have same height in future which actaul
        ///post tile have :)
        ///
        ///
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: Colors.black.withOpacity(0.14)),
            child: Opacity(
              opacity: 0.1,
              child: Row(
                children: [
                  //FIRT COMPONENET
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 14),
                    child: ImageContainer(
                      assetImage: widget.index % 2 == 0
                          ? '$assets/story_cover0.png'
                          : '$assets/story_cover1.png',
                      height: 141.h,
                      width: 92.h,
                    ),
                  ),

                  ///
                  ///second componenet
                  ///
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              widget.index % 2 == 0
                                  ? "The Wee Free Men"
                                  : 'Mermaid of Rescue',
                              style: bodyTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            )),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5.0, bottom: 31.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                widget.index % 2 == 0
                                    ? "By Terry Pratchett"
                                    : 'By Elizabeth',
                                style: subBodyTextStyle.copyWith(
                                    fontSize: 12.sp,
                                    color: greyColor.withOpacity(1),
                                    fontWeight: FontWeight.w600),
                              )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('read Story pressed');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 4),
                                // height: 22.h,
                                // width: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0.r),
                                  color: Color(0XFF6C9FCE),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Read",
                                      style: subBodyTextStyle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  //Third componenet
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        print(
                            "Value discovery of story ${widget.index} pressed");
                      },
                      child: Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: mainThemeColor,
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Value\nDiscovery",
                                textAlign: TextAlign.center,
                                style: leikoHeadingTextStyle.copyWith(
                                    fontSize: 14.sp, color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        ////
        ///Lock ICON
        ///
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: GestureDetector(
              onTap: () async {
                print('Lock icon pressed');
                var prefs = await SharedPreferences.getInstance();
                if (prefs.containsKey("UserData")) {
                  Get.to(() => PaymentMain());
                } else {
                  setState(() {
                    fromProfile = false;
                  });

                  Get.to(() => SignUpScreen());
                }
              },
              child: Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8, // has the effect of softening the shadow
                        spreadRadius:
                            1.2, // has the effect of extending the shadow
                        offset: Offset(
                          0, // horizontal, move right 10
                          0.4, // vertical, move down 10
                        ),
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageContainer(
                      assetImage: '$assets/lock.png',
                      height: 15.3,
                      width: 12.06.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
