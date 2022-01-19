// import 'package:flutter/material.dart';
// import 'package:ponansasa_patient_app/core/constants/colors.dart';
// import 'package:ponansasa_patient_app/core/constants/textstyle.dart';


// typedef CameraPressed= void Function();
// typedef GalleryPressed= void Function();
// class ProfileImageBottomSheet extends StatelessWidget {
//   final CameraPressed cameraPressed;
//   final GalleryPressed galleryPressed;
//   ProfileImageBottomSheet({this.cameraPressed,this.galleryPressed});
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//           height: 200,
//           color: Color(0xFF757575),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20.0),
//                 topRight: Radius.circular(20.0),
//               ),
//               color: Colors.white,
//             ),
//             child:Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   BottomSheetTile(
//                     title: 'Camera',
//                     subtitle: 'Capture prescription using Camera',
//                     icon: Icons.camera_alt,
//                     onPressed: cameraPressed,
//                   ),
//                   BottomSheetTile(
//                     title: 'Phone Media',
//                     subtitle: 'Pick your prescription from storage',
//                     icon: Icons.sd_storage,
//                     onPressed: galleryPressed,
//                   ),
//                 ],
//               ),
           
//           ),
//     );
//   }
// }

// class BottomSheetTile extends StatelessWidget {
//   final title;
//   final subtitle;
//   final icon;
//   final onPressed;

//   BottomSheetTile({this.title, this.subtitle, this.icon, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10),
//         child: ListTile(
//           leading: Icon(icon, color: blueThemeColor, size: 30),
//           title: Text(title, style: subHeadingTextStyle.copyWith(fontSize: 14)),
//           subtitle: Text(subtitle, style: bodyTextStyle.copyWith(fontSize: 10)),
//         ),
//       ),
//     );
//   }
// }
