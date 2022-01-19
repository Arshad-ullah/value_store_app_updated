import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/models/languages.dart';
import 'package:value_stories_app/core/view_models/base_view_model.dart';

class ChangeLanguageViewModel extends BaseViewModel {
  ChangeLanguageViewModel() {
    injectLocale();
    //after this u have to get the selected local from sharedprefs or any other resource if already user selected someone
    //getSelectedLocale();
  }

  List<Language> locales = [];

  injectLocale() {
    locales.add(Language("$assets/usa_flag.png", 'ENGLISH US'));
    // locales.add(Language("$assets/turkey_flag.png", 'TURKISH'));
    // locales.add(Language("$assets/portogues_flag.png", 'PORTUGUESE'));
  }
}
