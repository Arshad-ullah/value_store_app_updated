// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';

// import '../../locator.dart';
// import './../constants/api_endpoints.dart';
// import 'auth_data_service.dart';

// class ApiServices {
//   Dio launch() {
//     final accessToken = locator<AuthDataService>().accessToken;
//     Dio dio = new Dio();
//     dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
//     dio.interceptors.add(
//         DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers["accept"] = 'application/json';
// //    if (token != null) dio.options.headers["Authorization"] = 'Bearer $token';
// //    SharedPreferencesProvider().getToken().then((value) {
// //      print("bearer token load $value");
// //      if (value != null) dio.options.headers["Authorization"] = 'Bearer $value';
// //    });

//     if (accessToken != null)
//       dio.options.headers["Authorization"] = 'Bearer $accessToken';
//     dio.options.followRedirects = false;
//     dio.options.validateStatus = (s) {
//       return s < 500;
//     };

//     return dio;
//   }

//   Dio launch2() {
//     final accessToken = locator<AuthDataService>().accessToken;
//     Dio dio = new Dio();
//     dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
//     dio.interceptors.add(
//         DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
//     // dio.options.headers['Content-Type'] = 'application/json';
//     // dio.options.headers["accept"] = 'application/json';
// //    if (token != null) dio.options.headers["Authorization"] = 'Bearer $token';
// //    SharedPreferencesProvider().getToken().then((value) {
// //      print("bearer token load $value");
// //      if (value != null) dio.options.headers["Authorization"] = 'Bearer $value';
// //    });

//     if (accessToken != null)
//       dio.options.headers["Authorization"] = 'Bearer $accessToken';
//     dio.options.followRedirects = false;
//     dio.options.validateStatus = (s) {
//       return s < 500;
//     };

//     return dio;
//   }
// }
