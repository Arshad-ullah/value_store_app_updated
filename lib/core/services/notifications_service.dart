// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ponansasa_patient_app/core/models/fcm_notification.dart';
// import 'package:ponansasa_patient_app/core/services/auth_data_service.dart';
// import 'package:ponansasa_patient_app/locator.dart';

// //import 'package:oktoast/oktoast.dart';
// import 'package:provider/provider.dart';

// class NotificationsService {
//   var _fcm = FirebaseMessaging();
//   GlobalKey<NavigatorState> _navKey;

// //  NotificationsStatusProvider notificationsStatusProvider;

//   void initConfigure({navKey}) {
//     _navKey = navKey;
// //    notificationsStatusProvider = Provider.of<NotificationsStatusProvider>(
// //        _navKey.currentContext,
// //        listen: false);

//     _fcm.configure(
//       onMessage: _onMessage,
//       onLaunch: _onLaunch,
//       onResume: _onResume,
//       onBackgroundMessage: _backgroundMessageHandler,
//     );
//   }

//   Future<dynamic> _onMessage(Map<String, dynamic> message) async {
//     print('@onMessage');
//     try {
//       final notification = FcmNotification.fromJson(message);

//       /// To update the UI showing there is a new notification
//       if (locator<AuthDataService>().isLogin) {
//         if (_isVideoCall(notification.type)) {
// //          _showMessageToast(notification);
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<dynamic> _onResume(Map<String, dynamic> message) async {
//     print('@onResume');
//     final notification = FcmNotification.fromJson(message);
// //    _handleMessage(notification);
//   }

//   Future<dynamic> _onLaunch(Map<String, dynamic> message) async {
//     print('@onLaunch');
// //    final notification = FcmNotification.fromJson(message);
// //    _handleMessage(notification);
//   }

// //  _handleMessage(FcmNotification notification) async {
// //    print('@handleMessage');
// //
// //    /// To update the UI showing there is a new notification
// //    try {
// //      if (locator<AuthDataService>().isLogin) {
// //        if (_) {
// ////          notificationsStatusProvider.updateMessageStatus(true);
// //          _navKey.currentState.pushNamed('messages');
// //        } else {
// //          notificationsStatusProvider.updateNotificationStatus(true);
// //          _navKey.currentState.pushNamed('notifications');
// //        }
// //      }
// //    } catch (e) {
// //      print('Exception @_onMessage: $e');
// //    }
// //  }

//   static Future<dynamic> _backgroundMessageHandler(
//       Map<String, dynamic> message) {
//     print('@backgroundMessageHandler');
//   }

// //  _showMessageToast(FcmNotification notification) {
// //    showToastWidget(
// //      getToastWidget(notification),
// //      position: ToastPosition(align: Alignment.topCenter, offset: 20),
// //      duration: Duration(milliseconds: 3000),
// //      handleTouch: true,
// //    );
// //  }
// //
// //  Widget getToastWidget(FcmNotification notification) {
// //    print('@toastWidget');
// //    return GestureDetector(
// //      onTap: () {
// //        print('Toast clicked');
// //        if (_navKey.currentContext.read<AuthModel>().isLogin) {
// //          if (notification.type == 'message')
// //            _navKey.currentState.pushNamed('conversations');
// //          else
// //            _navKey.currentState.pushNamed('notifications');
// //        }
// //      },
// //      child: Container(
// //          width: MediaQuery.of(_navKey.currentContext).size.width,
// //          height: 80,
// //          decoration: BoxDecoration(
// //            color: Color(0xFFececec),
// //            borderRadius: BorderRadius.circular(15),
// //          ),
// //          child: Row(
// //            children: <Widget>[
// //              Image.asset(
// //                'assets/static_assets/alyf_rounded_icon.png',
// //                width: 53,
// //                height: 53,
// //                fit: BoxFit.contain,
// //              ),
// //              SizedBox(width: 10),
// //              Column(
// //                crossAxisAlignment: CrossAxisAlignment.start,
// //                mainAxisAlignment: MainAxisAlignment.center,
// //                children: <Widget>[
// //                  Text(notification.title ?? '', style: subHeadingTextStyle),
// //                  Text(notification.body ?? '', style: subBodyTextStyle),
// //                ],
// //              ),
// //            ],
// //          )
// ////        child: Column(
// ////          children: <Widget>[
// ////            Text(notification.title ?? '', style: subHeadingTextStyle),
// ////            Text(notification.body ?? '', style: subBodyTextStyle),
// ////          ],
// ////        ),
// //          ),
// //    );
// //  }
//   _isVideoCall(String type) {
//     if (type == 'video_call')
//       return true;
//     else
//       return false;
//   }
// }
