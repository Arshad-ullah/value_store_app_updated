// import 'package:app_settings/app_settings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationService {
//   Position patientPosition;
//   Placemark patientAddress;

//   bool serviceEnabled = false;
//   LocationPermission permission;
// //this funciton will get current location of the patient
//   getLocation() async {
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     print("Service Enabled bool ===> $serviceEnabled");
//     if (!serviceEnabled) {
//       permission = await Geolocator.requestPermission();
//       // Location services are not enabled don't continue
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         // Permissions are denied forever, handle appropriately.
//         return Future.error(
//             'Location permissions are permanently denied, we cannot request permissions.');
//       }
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   getCurrentLocation() async {
//     print("@Getting Current Location ");
//     try {
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       permission = await Geolocator.checkPermission();
//       permission = await Geolocator.requestPermission();
//       print("Permission Location Service==> $permission");

//       if (permission == LocationPermission.always ||
//           permission == LocationPermission.whileInUse) {
//         try {
//           patientPosition = await Geolocator.getCurrentPosition(
//               desiredAccuracy: LocationAccuracy.high);
//         } catch (e) {
//           if (e == "The location service on the device is disabled.") {
//             print(e);
//             return Future.error("location disabled");
//           }
//         }
//         serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       }
//       if (serviceEnabled) {
//         print("Patient Current Cordinates====> ${patientPosition.toJson()}");
//         //Now getting address from patient position
//         List<Placemark> placemarks = await placemarkFromCoordinates(
//             patientPosition.latitude, patientPosition.longitude);
//         patientAddress = placemarks.first;
//         print(
//             "Patient Current Address/PlaceMark===> ${patientAddress.locality}, ${patientAddress.country}");
//       }
//     } catch (e, s) {
//       print("@GetCurrentLocation/Exception==> $e Stacktrace $s");
//     }
//   }

//   ///
//   ///Check permissions
//   ///
//   checkLocationPermissions() async {
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     permission = await Geolocator.checkPermission();
//     if (!serviceEnabled) {
//       // AppSettings.openLocationSettings();
//       if (permission == LocationPermission.always ||
//           permission == LocationPermission.whileInUse) {
//         await getCurrentLocation();
//       } else {
//         return Future.error("Permission Denied");
//       }
//     } else {
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         return Future.error("Permission Denied");
//       }
//     }
//   }

//   ///
//   ///this function will return address when someone give parameter as argument to it
//   ///
//   getAddressFromLatLang({@required lat, @required long}) async {
//     print("Patient Current Cordinates====> lattitude $lat  longitude  $long");
//     //Now getting address from current lat lang
//     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//     Placemark address = placemarks.first;
//     print(
//         "Get address form latlang===> ${address.locality}, ${patientAddress.country}");
//     return "${address.street}";
//   }
// }
