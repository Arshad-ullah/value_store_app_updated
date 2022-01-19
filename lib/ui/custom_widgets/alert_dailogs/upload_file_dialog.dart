// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as P;
// import 'package:ponansasa_patient_app/core/constants/colors.dart';

// import '../rounded_blue_btn.dart';

// class UploadFileDialog extends StatelessWidget {
//   final onSendPressed;
//   final bool isFile;
//   final File file;

//   UploadFileDialog({this.onSendPressed, this.isFile = false, this.file});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: isFile ? 200 : 500,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             isFile
//                 ? Column(
//                     children: [
//                       Icon(Icons.insert_drive_file, color: colorPrimary),
//                       Text('${P.basename(file.path) ?? 'Selected File'}'),
//                     ],
//                   )
//                 : Image(
//                     image: FileImage(file),
//                     width: double.infinity,
//                     height: 300,
//                     fit: BoxFit.fitHeight,
//                   ),
//             SizedBox(height: 40),
//             RoundedBlueButton(text: 'Send', onPressed: onSendPressed)
//           ],
//         ),
//       ),
//     );
//   }
// }
