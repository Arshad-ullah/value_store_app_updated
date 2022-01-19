// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ponansasa_patient_app/core/constants/colors.dart';
// import 'package:ponansasa_patient_app/core/constants/textstyle.dart';
// import 'package:ponansasa_patient_app/ui/screens/root-screen.dart';

// class CancelConsultationDialog extends StatelessWidget {
//   final Function onOkPressed;
//   CancelConsultationDialog({this.onOkPressed});
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 150,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 14),
//               child: Text(
//                 "Are you sure to end consultation?",
//                 textAlign: TextAlign.center,
//                 style: subBodyTextStyle.copyWith(),
//                 textScaleFactor: 1.1,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(),
//                 Row(
//                   children: [
//                     Container(
//                         // width: 150,
//                         child: FlatButton(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)),
//                             textColor: Colors.red,
//                             onPressed: () {
//                               Navigator.of(context).pop(false);
//                             },
//                             child: Text(
//                               "Cancel",
//                               style:
//                                   subBodyTextStyle.copyWith(color: Colors.red),
//                             ))),
//                     Container(
//                         // width: 150,
//                         child: FlatButton(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)),
//                             textColor: Colors.white,
//                             color: blueBtnColor,
//                             onPressed: () {
//                               onOkPressed();
//                               Get.offAll(RootScreen());
//                             },
//                             child: Text(
//                               "Yes Sure",
//                               style: subBodyTextStyle.copyWith(
//                                   color: Colors.white),
//                             ))),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
