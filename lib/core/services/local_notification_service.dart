// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io' show File, Platform;
// import 'package:http/http.dart' as http;

// import 'package:rxdart/subjects.dart';

// ///
// ///This class is used for initializing and setting up flutter local notifications and
// ///showing all kind of notification
// ///
// class LocalNotificationService {
//   //firstly declaring the flutterLocalNotificationPlugin instance and then initializing it in constructor
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   //This behaviouSubject instance is for listening purpose in ios either the fuction is recieved or not
//   //or if recieved then what event u want to trigger
//   final BehaviorSubject<ReceivedNotification>
//       didReceivedLocalNotificationSubject =
//       BehaviorSubject<ReceivedNotification>();
//   //declaring all initialization settings of FLNPlugin
//   var initializationSettings;

//   LocalNotificationService._() {
//     init();
//   }

//   init() async {
//     //so firstly we have to initialize our FLNPLUGIN instance
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     //now we have to check if platform is IOS request for permission otherwise android dont need any of permission
//     if (Platform.isIOS) {
//       _requestIOSPermission();
//     }
//     //Then we have to initialize paltform specific settings for our FLNPLUGIN instance
//     initializePlatformSpecifics();
//   }

//   ///
//   ///This function will initialize settings for ios as well as for android and then [initializationSettings] constructor
//   ///of FLNPLUGIN
//   ///
//   initializePlatformSpecifics() {
//     //firstly we have to do initialization for android
//     var initializationSettingsAndroid = AndroidInitializationSettings('mail');
//     //then for ios
//     var initializationSettingsIOS = IOSInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {
//         ReceivedNotification receivedNotification = ReceivedNotification(
//             id: id, title: title, body: body, payload: payload);
//         didReceivedLocalNotificationSubject.add(receivedNotification);
//       },
//     );

//     ///now finallt instantiating the [initializationSettings] for both OS/PLATFORMs
//     initializationSettings = InitializationSettings(
//         initializationSettingsAndroid, initializationSettingsIOS);
//   }

//   ///
//   ///This function will request for showing local notification permission in ios only
//   ///
//   _requestIOSPermission() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         .requestPermissions(
//           alert: false,
//           badge: true,
//           sound: true,
//         );
//   }

//   ///
//   ///This notification will listen for Notification triggered even in lower version of IOS
//   ///
//   setListenerForLowerVersions(Function onNotificationInLowerVersions) {
//     didReceivedLocalNotificationSubject.listen((receivedNotification) {
//       onNotificationInLowerVersions(receivedNotification);
//     });
//   }

//   ///
//   ///This function will set the recently setted initializeSetting for both PLATFORM in FLNPLUGIN
//   ///
//   setOnNotificationClick(Function onNotificationClick) async {
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String payload) async {
//       onNotificationClick(payload);
//     });
//   }

//   ///
//   ///This funciton will show instant notification
//   ///
//   Future<void> showNotification() async {
//     var androidChannelSpecifics = AndroidNotificationDetails(
//       'CHANNEL_ID',
//       'CHANNEL_NAME',
//       "CHANNEL_DESCRIPTION",
//       importance: Importance.Max,
//       priority: Priority.High,
//       playSound: true,
//       timeoutAfter: 5000,
//       styleInformation: DefaultStyleInformation(true, true),
//     );
//     var iosChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics =
//         NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Test Title',
//       'Test Body', //null
//       platformChannelSpecifics,
//       payload: 'New Payload',
//     );
//   }

//   ///
//   ///This function will show a single  notification at a particular single day time in a repetitive manner
//   ///
//   Future<void> showDailyAtTime(
//       {time, int channelId, channelName, channelDescription, index}) async {
//     print(
//         "NotificationTrigger==> Type==> Daily at particular time==> ${time.hour}:${time.minute}.${time.second}");
//     print(
//         "ChannelId => ${channelId + time.minute}, channelName => $channelName, channelDescription => $channelDescription ");
//     // var time = Time(15, 10, 0);
//     var androidChannelSpecifics = AndroidNotificationDetails(
//       '$channelId',
//       '$channelName',
//       "$channelDescription",
//       importance: Importance.Max,
//       priority: Priority.High,
//     );
//     var iosChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics =
//         NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
//     await flutterLocalNotificationsPlugin.showDailyAtTime(
//       // 0,//this thing will must be unique
//       channelId + time.minute,
//       'Test Title at ${time.hour}:${time.minute}.${time.second}',
//       'Test Body', //null
//       time,
//       platformChannelSpecifics,
//       payload: 'Test Payload',
//     );
//   }

//   Future<void> showWeeklyAtDayTime() async {
//     var time = Time(21, 5, 0);
//     var androidChannelSpecifics = AndroidNotificationDetails(
//       'CHANNEL_ID 5',
//       'CHANNEL_NAME 5',
//       "CHANNEL_DESCRIPTION 5",
//       importance: Importance.Max,
//       priority: Priority.High,
//     );
//     var iosChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics =
//         NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
//     await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
//       0,
//       'Test Title at ${time.hour}:${time.minute}.${time.second}',
//       'Test Body', //null
//       Day.Saturday,
//       time,
//       platformChannelSpecifics,
//       payload: 'Test Payload',
//     );
//   }

//   Future<void> repeatNotification() async {
//     var androidChannelSpecifics = AndroidNotificationDetails(
//       'CHANNEL_ID 3',
//       'CHANNEL_NAME 3',
//       "CHANNEL_DESCRIPTION 3",
//       importance: Importance.Max,
//       priority: Priority.High,
//       styleInformation: DefaultStyleInformation(true, true),
//     );
//     var iosChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics =
//         NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
//     await flutterLocalNotificationsPlugin.periodicallyShow(
//       0,
//       'Repeating Test Title',
//       'Repeating Test Body',
//       RepeatInterval.EveryMinute,
//       platformChannelSpecifics,
//       payload: 'Test Payload',
//     );
//   }

//   Future<void> scheduleNotification(
//       {DateTime scheduleTime,
//       int channelId,
//       channelName,
//       channelDescription,
//       index}) async {
//     print("Scheduled Notification time ==> ${scheduleTime.toString()}");
//     print(
//         "NotificationTrigger==> Type==> Daily at particular time==> ${scheduleTime.hour}:${scheduleTime.minute}.${scheduleTime.second}");
//     print(
//         "ChannelId => ${channelId + scheduleTime.minute}, channelName => $channelName, channelDescription => $channelDescription ");

//     var androidChannelSpecifics = AndroidNotificationDetails(
//       '$channelId',
//       '$channelName',
//       "$channelDescription",
//       importance: Importance.Max,
//       priority: Priority.High,
//       // );
//       // icon: 'secondary_icon',
//       // sound: RawResourceAndroidNotificationSound('my_sound'),
//       // largeIcon: DrawableResourceAndroidBitmap('large_notf_icon'),
//       enableLights: true,
//       color: const Color.fromARGB(255, 255, 0, 0),
//       ledColor: const Color.fromARGB(255, 255, 0, 0),
//       ledOnMs: 1000,
//       ledOffMs: 500,
//       playSound: true,
//       timeoutAfter: 5000,
//       styleInformation: DefaultStyleInformation(true, true),
//     );
//     var iosChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       androidChannelSpecifics,
//       iosChannelSpecifics,
//     );
//     await flutterLocalNotificationsPlugin.schedule(
//       // 0,//this thing will must be unique
//       channelId + scheduleTime.minute,
//       'Test Title at ${scheduleTime.hour}:${scheduleTime.minute}.${scheduleTime.second}',
//       'Test Body', //null
//       scheduleTime,
//       platformChannelSpecifics,
//       payload: 'Test Payload',
//     );
//   }

//   Future<void> showNotificationWithAttachment() async {
//     var attachmentPicturePath = await _downloadAndSaveFile(
//         'https://via.placeholder.com/800x200', 'attachment_img.jpg');
//     var iOSPlatformSpecifics = IOSNotificationDetails(
//       attachments: [IOSNotificationAttachment(attachmentPicturePath)],
//     );
//     var bigPictureStyleInformation = BigPictureStyleInformation(
//       FilePathAndroidBitmap(attachmentPicturePath),
//       contentTitle: '<b>Attached Image</b>',
//       htmlFormatContentTitle: true,
//       summaryText: 'Test Image',
//       htmlFormatSummaryText: true,
//     );
//     var androidChannelSpecifics = AndroidNotificationDetails(
//       'CHANNEL ID 2',
//       'CHANNEL NAME 2',
//       'CHANNEL DESCRIPTION 2',
//       importance: Importance.High,
//       priority: Priority.High,
//       styleInformation: bigPictureStyleInformation,
//     );
//     var notificationDetails =
//         NotificationDetails(androidChannelSpecifics, iOSPlatformSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Title with attachment',
//       'Body with Attachment',
//       notificationDetails,
//     );
//   }

//   _downloadAndSaveFile(String url, String fileName) async {
//     var directory = await getApplicationDocumentsDirectory();
//     var filePath = '${directory.path}/$fileName';
//     var response = await http.get(url);
//     var file = File(filePath);
//     await file.writeAsBytes(response.bodyBytes);
//     return filePath;
//   }

//   Future<int> getPendingNotificationCount() async {
//     List<PendingNotificationRequest> p =
//         await flutterLocalNotificationsPlugin.pendingNotificationRequests();
//     return p.length;
//   }

//   ///
//   ///This will cancel particular notification
//   ///
//   ///
//   Future<void> cancelNotification() async {
//     await flutterLocalNotificationsPlugin.cancel(0);
//   }

//   Future<void> cancelAllNotification() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
// }

// ///
// ///Initializing the LocalNotificationService Globally
// ///
// LocalNotificationService localNotificationService =
//     LocalNotificationService._();

// ///
// ///recived notification model class for ios didNotificationRecieved callback
// ///
// class ReceivedNotification {
//   final int id;
//   final String title;
//   final String body;
//   final String payload;

//   ReceivedNotification({
//     @required this.id,
//     @required this.title,
//     @required this.body,
//     @required this.payload,
//   });
// }
