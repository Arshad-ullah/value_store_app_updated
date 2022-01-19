// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/conversation.dart';
// import 'package:ponansasa_patient_app/core/models/profile-body.dart';
// import 'package:ponansasa_patient_app/core/services/shared_preferences.dart';

// import '../../locator.dart';
// import 'database_service.dart';

// ///
// ///
// ///This class is used for checking [user-token] or [firebase-current-user] if not [null] than
// /// directly navigate to dashboard screen other wise false the [isLogin flag] to [false ] so
// /// that user have to login again
// ///
// ///
// class AuthDataService {
//   bool isLogin;
//   String accessToken;
//   String refreshToken;
//   String onBoardingStatus;
//   User firebaseUser;
//   final _sharePrefsProvider = SharedPreferencesProvider();
//   ProfileBody patientProfile;
//   Conversation conversation;

// //  AuthDataService() {
// //    doSetup();
// //  }

//   ///
//   /// [doSetup] function does all the initial settings including:
//   /// 1) Getting auth tokens from sharePrefs
//   /// 2) Getting firebase user
//   /// 3) Getting user data from the backend
//   ///
//   doSetup() async {
//     print("@authDataService/doSetup");
//     try {
//       accessToken = await _sharePrefsProvider.getToken();
//       refreshToken = await _sharePrefsProvider.getRefreshToken();
//       onBoardingStatus = await _sharePrefsProvider.getOnBoardingStatus();
//       print("Auth Token: $accessToken");
//       print("Refresh Token: $refreshToken");
//       firebaseUser = FirebaseAuth.instance.currentUser;
//       isLogin = accessToken != null && firebaseUser != null;
//       print("Firebase User ==> ${firebaseUser?.uid}");
//       if (isLogin) {
//         await getProfileBody();
//       }
//     } catch (e, s) {
//       print(e);
//       print(s);
//     }
//   }

//   //this function will set the Coversation so that we can use it globally
//   ////THAT I AM USING IN AUDIO VIDEO SCREEN (i:e the popup conversation in audio video screen used this conversation instance)
//   setConversation(Conversation conversation) {
//     this.conversation = conversation;
//     print(
//         "Updated the AuthServices_Conversation ===>${this.conversation.toJson()}");
//   }

// //this  function will update the boarding status using the sharedpreferences
//   updateOnBoardingStatus(status) {
//     onBoardingStatus = status;
//     _sharePrefsProvider.setOnBoardingStatus(status);
//   }

//   getProfileBody() async {
//     patientProfile = await locator<DatabaseService>().getProfileBody();
//   }

//   updateAccessToken(newToken) async {
//     accessToken = newToken;
//     await SharedPreferencesProvider().saveToken(accessToken);
//   }

//   updateRefreshToken(newToken) async {
//     refreshToken = newToken;
//     await SharedPreferencesProvider().saveRefreshToken(refreshToken);
//   }

//   clear() async {
//     isLogin = false;
//     accessToken = null;
//     refreshToken = null;
//     firebaseUser = null;
//     await SharedPreferencesProvider().clearToken();
//     await SharedPreferencesProvider().clearRefreshToken();
//     await SharedPreferencesProvider().saveLoginState(false);
//   }
// }
