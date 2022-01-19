// import 'package:flutter/material.dart';

// import '../rounded_blue_btn.dart';

// typedef OnPressed = void Function();

// class ImageSuccessDialog extends StatelessWidget {
//   final OnPressed onPressed;
//   final selectedImageFile;
//   ImageSuccessDialog({this.onPressed, this.selectedImageFile});
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 500,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             (selectedImageFile != null)
//                 ? Image(
//                     image: FileImage(selectedImageFile),
//                     width: double.infinity,
//                     height: 300,
//                     fit: BoxFit.fitHeight,
//                   )
//                 : Center(
//                     child: CircularProgressIndicator(),
//                   ),
//             SizedBox(height: 40),
//             RoundedBlueButton(
//               text: 'Use this Photo',
//               onPressed: onPressed,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
