// import 'dart:io';
// import 'dart:async';
// // import 'package:file_picker/file_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:gx_file_picker/gx_file_picker.dart';

// ///
// ///This is image-picking services which are used globally by different view models
// ///
// class FilePickerService {
//   var picker = ImagePicker();

//   ///
//   ///Getting image from gallery
//   ///
//   Future<File> pickImageFromGallery() async {
//     final pickedFile = await picker.getImage(
//       source: ImageSource.gallery,
//     );
//     return File(pickedFile.path);
//   }

//   ///
//   ///Getting image from Camera
//   ///
//   Future<File> pickImageFromCamera() async {
//     final pickedFile = await picker.getImage(
//       source: ImageSource.camera,
//     );
//     return File(pickedFile.path);
//   }

//   ///
//   ///Getting file from file browser
//   ///
//   Future<File> pickFileFromBrowser() async {
//     // File file = await FilePicker.getFile(type: FileType.custom);
//     File file;
//     try {
//       file = await FilePicker.getFile(type: FileType.custom);

//       if (file != null) {
//         return file;
//       } else {
//         // User canceled the picker
//         print("USER cancelled the picker");
//         return null;
//       }
//     } on PlatformException catch (e) {
//       print("File picker exception ==>$e");
//     }
//     return file ?? null;
//   }
// }
