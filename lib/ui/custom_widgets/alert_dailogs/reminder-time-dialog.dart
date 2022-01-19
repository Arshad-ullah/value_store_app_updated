// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ponansasa_patient_app/core/constants/textstyle.dart';
// import 'package:ponansasa_patient_app/ui/custom_widgets/rounded_blue_btn.dart';
// import 'package:ponansasa_patient_app/ui/screens/others/reminder/reminders-view-model.dart';
// import 'package:provider/provider.dart';

// class ReminderTimeDialog extends StatelessWidget {
//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 240,
//         child: Consumer<ReminderViewModel>(
//           builder: (context, model, child) => Form(
//             key: formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 //title of dialog
//                 Padding(
//                   padding: const EdgeInsets.only(top: 18.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Add Reminder Time",
//                         style: bodyTextStyle.copyWith(
//                             fontWeight: FontWeight.w600, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //text feidl
//                 GestureDetector(
//                   onTap: () async {
//                     print("select time pressesd");
//                     //taking time from user
//                     final TimeOfDay timePicked = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay(
//                           hour: DateTime.now().hour,
//                           minute: DateTime.now().minute,
//                         ));
//                     if (timePicked != null) {
//                       print(
//                           "GET REMINDER TIME==> ${timePicked.format(context)}");
//                       model.setReminderTime(timePicked, context);
//                     }
//                     // showDatePicker(
//                     //   context: context,
//                     //   initialDate: DateTime.now(),
//                     //   firstDate: DateTime(2021, 4, 7),
//                     //   lastDate: DateTime(2021, 4, 30),
//                     // );
//                     //
//                   },
//                   child: TextFormField(
//                     controller: TextEditingController(
//                         text: model.reminderTime.format(context) ?? "00:00"),
//                     enabled: false,
//                     onSaved: (s) {
//                       // TimeOfDay pickedTime = TimeOfDay(
//                       //     hour: int.parse(s.split(":")[0]),
//                       //     minute: int.parse(s.split(":")[1]));
//                       // model.reminderTime = pickedTime;
//                       // model.reminderTime = s;
//                     },
//                     validator: (input) {
//                       if (input.isEmpty) {
//                         return "Please select time first";
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: appBarTextStyle3,
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         errorStyle: TextStyle(color: Colors.red),
//                         contentPadding: EdgeInsets.only(top: 18.0),
//                         hintText: "Select reminder time"),
//                   ),
//                 ),

//                 //add timings button
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 18.0, left: 28, right: 28),
//                   child: RoundedBlueButton(
//                     text: "Add",
//                     onPressed: () {
//                       if (formkey.currentState.validate()) {
//                         formkey.currentState.save();
//                         model.addReminderTime(context);
//                         Get.back();
//                       }
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       // ),
//     );
//   }
// }
