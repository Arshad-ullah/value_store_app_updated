import 'package:flutter/cupertino.dart';
import 'package:value_stories_app/core/enums/view-state.dart';
import 'package:value_stories_app/core/view_models/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
   HomeViewModel() {
    promoController = PageController(initialPage: 0);
     currentIndexPage = 0;
  }

  int? currentIndexPage;
  int bannerCount = 0;
  PageController promoController=PageController();

  setCurrentIndexPage(int index) {
    currentIndexPage = index;
    setState(ViewState.idle);
  }
}
