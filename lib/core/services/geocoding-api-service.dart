// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:ponansasa_patient_app/core/constants/api_endpoints.dart';
// import 'package:ponansasa_patient_app/core/models/geocoding-api.dart';

// ///
// ///This class is used for getting all types of locality sublocality with mature surity using [Google-geocoding-API],
// ///we registered this class instance with [locator] so that its constructor will calls only once and henve there we used
// ///this [GeocodingApiService] instance as a [singleton]
// ///
// class GeocodingApiService {
// //setting up GeocodingApiService constructor
//   // GeocodingApiService() {
//   //   initService();
//   // }

//   //instance for doing GET request
//   Dio _dio = Dio();
//   // instance for holding response
//   Response _response = Response();
//   // instance for holding data of response in dart patttern
//   GeocodingApi geocodingApi = GeocodingApi();
//   //api key for full access
//   final String _GECODING_API_KEY = "AIzaSyA9uOKAFlqlY2cLnpXYuAF83uucTqoi1Hs";

//   ///
//   ///[initializing] api services by doing the post request only once and then use the data everywhere
//   ///
//   initGeocodingService({@required lat, @required lng}) async {
//     print("initGeocodingService $lat \t $lng");
//     try {
//       //doing request
//       _response = await _dio.get(
//           '${EndPoint.geocodingBaseUrl}latlng=$lat,$lng&key=$_GECODING_API_KEY');
//       if (_response.statusCode == 200) {
//         //Decoding response data to dart class
//         geocodingApi = GeocodingApi.fromJson(_response.data);
//         print(
//             "GEOCODING_RESPONSE=> $_response toJson() => ${geocodingApi.toJson()}");
//       }
//     } catch (e, s) {
//       print(
//           "@Exception/InitializingGeocodingAPiServices/=> $e \n StackTrace => $s");
//     }
//   }

//   ///
//   ///This function will return country from the [geocodingApi] using reverse geocoding method
//   ///
//   getCountry() {
//     print("GetCountry");
//     try {
//       String country =
//           geocodingApi.results[0].addressComponents[7].longName ?? "Null";
//       return country;
//     } catch (e, s) {
//       print("@Exception/getCountry=> $e, \n StackTrace=>$s");
//     }
//   }

//   ///
//   ///This function will return [city-name]
//   ///
//   getCity() {
//     print("GetCity");
//     try {
//       String city =
//           geocodingApi.results[0].addressComponents[3].longName ?? "Null";
//       return city;
//     } catch (e, s) {
//       print("@Exception/getCity=> $e, \n StackTrace=>$s");
//     }
//   }

//   ///
//   ///This function will return exact [street-number] of street
//   ///
//   getStreetNumber() {
//     print("GetStreetNumber");
//     try {
//       String streetNumber =
//           geocodingApi.results[0].addressComponents[0].longName ?? "Null";
//       return streetNumber;
//     } catch (e, s) {
//       print("@Exception/GetStreetNumber=> $e, \n StackTrace=>$s");
//     }
//   }

//   ///
//   ///This function will return exact [sub-locality] name
//   ///
//   getSubLocality() {
//     print("getSubLocality");
//     try {
//       String subLocality =
//           geocodingApi.results[0].addressComponents[2].longName ?? "Null";
//       return subLocality;
//     } catch (e, s) {
//       print("@Exception/getSubLocality=> $e, \n StackTrace=>$s");
//     }
//   }

//   ///
//   ///This function will get only [street-route] in return whenever some one call this
//   ///
//   getStreetRoute() {
//     print("getStreetRoute");
//     try {
//       String streetRoute =
//           geocodingApi.results[0].addressComponents[1].longName ?? "Null";
//       return streetRoute;
//     } catch (e, s) {
//       print("@Exception/GetStreeRoute=> $e, \n StackTrace=>$s");
//     }
//   }

//   getAdressFromLatLng({@required lat, @required lng}) async {
//     print("GetAdressFromLatLng $lat \t $lng");
//     GeocodingApi geoObj = GeocodingApi();
//     try {
//       //doing request
//       final response = await _dio.get(
//           '${EndPoint.geocodingBaseUrl}latlng=$lat,$lng&key=$_GECODING_API_KEY');
//       if (response.statusCode == 200) {
//         //Decoding response data to dart class
//         geoObj = GeocodingApi.fromJson(response.data);
//         print(
//             "GEOCODING_RESPONSE=> $response toJson() => ${geocodingApi.toJson()}");
//       }
//       return geoObj;
//     } catch (e, s) {
//       print("@Exception/GetAdressFromLatLng/=> $e \n StackTrace => $s");
//     }
//   }
// }
