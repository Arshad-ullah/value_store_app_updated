// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:ponansasa_patient_app/core/constants/textstyle.dart';
// import 'package:ponansasa_patient_app/ui/custom_widgets/image-container.dart';

// import '../rounded_blue_btn.dart';

// typedef OnRatingUpdate = Function(double);
// typedef OnSavePressed = Function(String);

// class CallReviewDialog extends StatefulWidget {
//   final Function onSubmitPressed;
//   final Function onSavePressed;

//   final OnRatingUpdate onRatingUpdate;
//   CallReviewDialog(
//       {this.onSubmitPressed, this.onSavePressed, this.onRatingUpdate});

//   @override
//   _CallReviewDialogState createState() => _CallReviewDialogState();
// }

// class _CallReviewDialogState extends State<CallReviewDialog> {
//   var _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: EdgeInsets.only(left: 15.0, right: 15.0),
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 350,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             //doctor avatar

//             Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: ImageContainer(
//                   assetImage: "assets/static_assets/doctor1.png",
//                   height: 70,
//                   width: 70,
//                 ),
//               ),
//             ),

//             //text about doctor

//             Padding(
//               padding: const EdgeInsets.only(top: 18.0),
//               child: Text(
//                 "Great Doctor? Rate Them",
//                 style: subBodyTextStyle,
//               ),
//             ),
//             //rating dynamic stars
//             giveReview(context),
//             //textfield for comments
//             addCommentTextField(context),
//             //submit button for submitting the review
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 100,
//                   child: RoundedBlueButton(
//                       text: 'Submit',
//                       onPressed: () {
//                         if (_formKey.currentState.validate()) {
//                           _formKey.currentState.save();
//                           this.widget.onSubmitPressed();
//                         }
//                       }),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   giveReview(context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 25.0, bottom: 10.6),
//           child: RatingBar.builder(
//               itemCount: 5,
//               glowColor: Colors.yellowAccent,
//               allowHalfRating: true,
//               itemBuilder: (context, index) {
//                 return Icon(
//                   Icons.star,
//                   color: Colors.yellow,
//                   size: 33.09,
//                 );
//               },
//               onRatingUpdate: this.widget.onRatingUpdate),
//         )
//       ],
//     );
//   }

//   addCommentTextField(context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 15, right: 15, top: 6.0, bottom: 20),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return "please enter some comments";
//                 } else {
//                   return null;
//                 }
//               },
//               onSaved: widget.onSavePressed,
//               style: appBarTextStyle.copyWith(fontSize: 14),
//               decoration: InputDecoration(
//                 hintText: "Input your reviews",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
