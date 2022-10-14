// part of 'services.dart';

// class NotificationService {
// // buat init Package
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

// // buat Show Notif
//   void init(
//       Future<dynamic> Function(int, String?, String?, String?)? onDidReceive) {
// // buat init Android
//     final AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings(appIcon);
// //buat Init IOS
//     final DarwinInitializationSettings iosSettings =
//         DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//       onDidReceiveLocalNotification: onDidReceive,
//     );
// //buat init Setting
//     final InitializationSettings initSetting =
//         InitializationSettings(android: androidSettings, iOS: iosSettings);
//   }

//   // buat init Pluggin
//   void initLocalNotif(InitializationSettings initSetting) async {
//     await localNotif.initialize(initSetting);
//   }

//   // TODO Show Notif
//   void showNotif(String message) async {
//     AndroidNotificationDetails androidNotifDetail =
//         const AndroidNotificationDetails(channelId, 'Belajar Salt');

//     await localNotif.show(12345, "Hallo", message,
//         NotificationDetails(android: androidNotifDetail));
//   }

// // TODO: Scheduled Notif Birhtday

// //TODO:

// }
