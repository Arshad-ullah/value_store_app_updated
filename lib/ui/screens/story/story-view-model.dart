import 'package:flutter/material.dart';
//import 'package:simple_html_css/simple_html_css.dart';
import 'package:value_stories_app/core/enums/view-state.dart';
import 'package:value_stories_app/core/view_models/base_view_model.dart';

class StoryViewModel extends BaseViewModel {
  StoryViewModel(context) {
    getHtmlData(context);
  }

  bool isDarkMode = false;
  bool isLargeText = false;
  bool isHeightedTex = false;
  TextAlign textAlignment = TextAlign.left;
  TextSpan? textSpan;
  String htmlData = '';

  setDarkMode() {
    isDarkMode = !isDarkMode;
    setState(ViewState.idle);
  }

  setLargeText() {
    isLargeText = !isLargeText;
    setState(ViewState.idle);
  }

  setHeightedText() {
    isHeightedTex = !isHeightedTex;
    setState(ViewState.idle);
  }

  setTextAdjusment(value) {
    textAlignment = value;
    setState(ViewState.idle);
  }

  getHtmlData(context) async {
    print('@Getting html data');

    ///
    ///First get the html content from db
    ///
//i:e htmlContent=await _dbService.getHtmlContent();
    // <h1>The Little red riding hood</h1>
    // <h5>by Charles perrault's</h5>

    htmlData = """
  <body  height: 100%;
   overflow-y: hidden;>
   <p>
  t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)
t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
  </p>    
 <img src='asset:assets/static_assets/banner2.png' width='300' height='200' />
 <p>
  t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)
t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
  </p>    
   
 
</body>

""";
  }
}
