// import 'package:flutter/material.dart';
// import 'package:ponansasa_patient_app/ui/screens/profile/profile-view-model.dart';
// import 'package:provider/provider.dart';

// import '../rounded_blue_btn.dart';

// class ProfileImageSuccessDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 500,
//         child: 
//         // ChangeNotifierProvider(
//         //   create: (context) => ProfileViewModel(),
//         //   child: 
//           Consumer<ProfileViewModel>(
//             builder: (context, model, child) => Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Image(
//                   image: FileImage(model.selectedImageFile),
//                   width: double.infinity,
//                   height: 300,
//                   fit: BoxFit.fitHeight,
//                 ),
//                 SizedBox(height: 40),
//                 RoundedBlueButton(
//                   text: 'Use this Photo',
//                   onPressed: () {
//                     print(
//                         'Selected Image Path: ${model.selectedImageFile.path}');
// //                  locator<DatabaseService>()
// //                      .uploadImage(model.selectedImageFile.path);
//                     try {
//                       // model.setArticleImage();
//                       Navigator.pop(context);
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => AddArticleDetailScreen()));
//                     } catch (e) {
//                       print('Exceptoin: $e');
//                     }
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       // ),
//     );
//   }
// }
