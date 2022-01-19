// import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ponansasa_patient_app/core/constants/api_endpoints.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/profile.dart';
// import 'package:ponansasa_patient_app/core/models/login-body.dart';
// import 'package:ponansasa_patient_app/core/models/register-body.dart';
// import 'package:ponansasa_patient_app/core/models/response/base_response.dart';
// import 'package:ponansasa_patient_app/core/models/response/login_response.dart';
// import 'package:ponansasa_patient_app/core/services/auth_exceptions_service.dart';

// import '../../locator.dart';
// import 'api_services.dart';
// import 'database_service.dart';

// ///
// ///This clss id used for patient authentication purpose from firebase as well as from custom
// ///backend
// ///
// class ApiRepository {
//   /// Dio is already setup with basic settings
//   Dio dio = ApiServices().launch();
//   final _firebaseAuth = FirebaseAuth.instance;
//   Profile profile = Profile();
//   Future<LoginResponse> reqRegister(RegisterBody body) async {
//     print("@reuestRegister: RegisterBody: ${body.toJson()}");
//     LoginResponse loginResponse = LoginResponse();
//     try {
//       final userCredentials =
//           await _firebaseAuth.createUserWithEmailAndPassword(
//               email: body.email, password: body.password);

//       ///
//       /// As we are using firebase for realtime chat.
//       /// So, that's why we also need the user to be [authenticated]
//       /// firebase as well.
//       ///

//       print("@requestRegister ======> User Credentials: $userCredentials");
//       if (userCredentials == null) {
//         loginResponse.success = false;
//         loginResponse
//             .addError('An unknown error happened while account creation');
//         return loginResponse;
//       }

//       /// Add firebase id to register body as well
//       body.firebaseUuid = userCredentials.user.uid;
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.apiRegister}",
//           data: body.toJson());
//       loginResponse = LoginResponse.fromJson(response.data);
//       print('Backend response: ${response.data}');

//       // If account creation in backend fails,
//       // then also delete the firebase account.=> what if account creation in firebase failed but backend succesfful
//       if (!loginResponse.success) {
//         userCredentials.user.delete();
//       }
//       if (loginResponse.success) {
//         ////
//         ///when user successfully created in both Firebase and custom backend then
//         ///adding it data to firebase Real time database
//         ///
//         profile.id = userCredentials.user.uid;
//         profile.name = body.username;
//         profile.imgUrl =
//             "https://i5.walmartimages.com/asr/a5ca3ae9-3890-4c5a-a219-42919e4d7816_1.0a7fe66eaafc93d2ee9b29367eaeab97.jpeg";
//         await locator<DatabaseService>().addFirebaseUser(profile);
//       }
//       return loginResponse;
//     } on FirebaseAuthException catch (e) {
//       final errorMessage = AuthExceptionsService.generateExceptionMessage(e);
//       loginResponse.success = false;
//       loginResponse.addError(errorMessage);
//     } catch (e) {
//       loginResponse.success = false;
//       loginResponse.addError(e.toString());
//     }
//     return loginResponse;
//   }

//   ///
//   ///A function for [requesting login/Authentication] from [firebase] as well as from custom [backend]
//   ///

//   Future<LoginResponse> reqLogin(LoginBody body) async {
//     print('@reqLogin');
//     LoginResponse loginResponse = new LoginResponse();
//     try {
//       final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
//           email: body.email, password: body.password);
//       if (userCredentials == null) {
//         loginResponse.success = false;
//         loginResponse.message =
//             'Failed to login user account. Please check your email and password';
//         return loginResponse;
//       }
//       loginResponse.user = userCredentials.user;
//       final response = await dio.post("${EndPoint.baseUrl}${EndPoint.apiLogin}",
//           data: body.toJson());
//       loginResponse = LoginResponse.fromJson(response.data);

//       /// If ponasasa backend login fails,
//       /// also logout the user from firebase.
//       if (!loginResponse.success) _firebaseAuth.signOut();
//       // loginResponse.user = userCredentials.user;
//       print('loginResponse: ${loginResponse.toJson()}');
//       return loginResponse;
//     } on FirebaseAuthException catch (e, s) {
//       print('Exception @loginReq: $e');
// //      Crashlytics.instance.recordError(e, s, context: 'Login Process');
// //      print(s);
//       final errorMessage = AuthExceptionsService.generateExceptionMessage(e);
//       loginResponse.success = false;
//       loginResponse.addError(errorMessage);
//       print('loginResponse: ${loginResponse.toJson()}');
//       return loginResponse;
//     } catch (e, s) {
//       // Crashlytics.instance.recordError(e, s, context: 'Login Process');
//       print('Exception @loginReq: $e');
//       loginResponse.success = false;
//       loginResponse.addError(e.toString());
//       print('loginResponse: ${loginResponse.toJson()}');
//       return loginResponse;
//     }
//   }

//   ///
//   ///This function will do a post request to a custom backend to update user data
//   ///
//   Future<BaseResponse> reqUpdateUser(body) async {
//     print("@reuestUpdateUser/");

//     BaseResponse baseResponse = BaseResponse();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.apiUpdateUser}",
//           data: body.toJson());
//       baseResponse = BaseResponse.fromJson(response.data);
//       print('Backend response: ${response.data}');
//     } catch (e) {
//       print("requestUpdateUser Exception==>$e");
//       baseResponse.success = false;
//       baseResponse.addError(e.toString());
//       return baseResponse;
//     }

//     return baseResponse;
//   }
// }
