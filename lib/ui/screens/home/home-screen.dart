import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:value_stories_app/core/constants/backendVariables.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/core/models/user.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:value_stories_app/ui/custom_widgets/story-tile.dart';
import 'package:value_stories_app/ui/screens/auth_registration/login/login-screen.dart';
import 'package:value_stories_app/ui/screens/change_language/change-language-screen.dart';
import 'package:value_stories_app/ui/screens/home/home-view-model.dart';
import 'package:value_stories_app/ui/screens/slider_details/slider-detail-screen.dart';
import 'package:value_stories_app/ui/screens/user_profile/user-profile-screen.dart';

dynamic bannerDetails;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   SharedPreferences? prefs;
  @override
  Future<void> didChangeDependencies() async {
    prefs = await SharedPreferences.getInstance();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // userDetails.likedStories.clear();
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => UtilityBaseScreen(
          bodyTopPadding: 175.h,
          appBarChild: _topAppBar(),

          ///
          ///body starts from here rora
          ///
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, top: 34.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///
                      ///slider having value stories promotion
                      ///
                      promoSlider(model),

                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 52.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            wombIndicator(model),
                          ],
                        ),
                      ),
                      // pageViewIndicator(model),

                      ///
                      ///tag of stories available
                      ///
                      Text(
                        "OUR STORIES",
                        style: headingTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),

                ///
                ///list of available stories
                ///
                listOFStories(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///slider having value stories promotion
  ///
  promoSlider(HomeViewModel model) {
    return Container(
      height: 112,
      color: Colors.white,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Banner Stories').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // setState(() {
          //   model.bannerCount = snapshot.data.documents.length;
          // });
          if (snapshot.data == null)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            );
          else
            return PageView.builder(
              controller: model.promoController,
              itemCount: snapshot.data!.docs.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                //will make this below a separate widget
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      bannerDetails = snapshot.data!.docs[index];
                    });
                    Get.to(() => SliderDetailScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          // color: blueThemeColor,
                          borderRadius: BorderRadius.circular(10.0.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data!.docs[index]["BannerPic"]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                );
              },

              //calling on pageChanged function to get index
              onPageChanged: (int index) {
                model.setCurrentIndexPage(index);
              },
            );
        },
      ),
    );
  }

  ///
  ///list of available stories
  ///
  listOFStories() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Stories').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            );
          else
            return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var documents;
                  return StoryTile(index, snapshot.data!.docs[index]);
                });
        });
  }

  wombIndicator(HomeViewModel model) {
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Banner Stories').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null)
              return Center(
                  // child: CircularProgressIndicator(
                  //   backgroundColor: Colors.red,
                  //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
                  // ),
                  );
            else
              return SmoothPageIndicator(
                controller: model.promoController,
                count: snapshot.data!.docs.length,
                effect: WormEffect(
                    dotColor: greyColor.withOpacity(0.6),
                    activeDotColor: mainThemeColor,
                    spacing: 8.0,
                    dotHeight: 10.h,
                    dotWidth: 10.w),
              );
          }),
    );
  }

  _topAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            icon: ImageContainer(
              assetImage: "$assets/usa_flag.png",
              height: 40.h,
              width: 40.w,
            ),
            onPressed: () {
              Get.to(() => ChangeLanguageScreen());
            }),
        Text('',
            // "Value Stories",
            style: leikoHeadingTextStyle.copyWith(
              fontSize: 26.sp,
              color: Colors.white,
              // fontWeight: FontWeight.bold
            )),
        IconButton(
            padding: EdgeInsets.zero,
            icon: ImageContainer(
              assetImage: "$assets/user.png",
              height: 40.h,
              width: 40.w,
            ),
            onPressed: () {
              if (prefs!.containsKey("LoggedIn"))
                Get.to(() => UserProfleScreen());
              else {
                setState(() {
                  fromProfile = true;
                });
                Get.to(() => LoginScreen());
              }
            }),
      ],
    );
  }

  pageViewIndicator(HomeViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          child: DotsIndicator(
            dotsCount: 3,
            position: model.currentIndexPage!.toDouble(),
            decorator: DotsDecorator(
              activeColor: mainThemeColor,
              color: greyColor.withOpacity(0.4),
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        )
      ],
    );
  }
}
