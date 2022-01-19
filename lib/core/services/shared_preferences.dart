// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesProvider {
//   static final SharedPreferencesProvider _singleton =
//       SharedPreferencesProvider._internal();

//   factory SharedPreferencesProvider() {
//     return _singleton;
//   }

//   SharedPreferencesProvider._internal();

//   saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//   }

//   clearToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', null);
//   }

//   Future<String> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("token");
//   }

//   saveRefreshToken(String userId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('refresh_token', userId);
//   }

//   clearRefreshToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('refresh_token', null);
//   }

//   Future<String> getRefreshToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("refresh_token");
//   }

//   saveFcmToken(String userId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fcm_token', userId);
//   }

//   clearFcmToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fcm_token', null);
//   }

//   Future<String> getFcmToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("fcm_token");
//   }

//   saveLoginState(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLogin', value);
//   }

//   Future<bool> getLoginState() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool("isLogin") ?? false;
//   }

//   Future<String> getOnBoardingStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("onBoardingStatus") ?? 'onBoarding_1';
//   }

//   Future<bool> setOnBoardingStatus(String status) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString("onBoardingStatus", status);
//   }

//   saveUser(String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_model', value);
//   }

//   Future<String> getUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("user_model");
//   }

//   setFirst(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isFirst', value);
//   }

//   Future<bool> isFirst() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool("isFirst");
//   }
// }
