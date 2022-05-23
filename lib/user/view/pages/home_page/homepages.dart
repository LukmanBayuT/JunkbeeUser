// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_init_to_null, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:junkbee_user/services/notification.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_news_api.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_user_statistic.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_widget_get_started.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_widget_userdata.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_widget_wastecategories.dart';

final SecureStorage secureStorage = SecureStorage();
final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

class HomepagesUser extends StatefulWidget {
  const HomepagesUser({Key? key}) : super(key: key);

  @override
  HomepagesUserState createState() => HomepagesUserState();
}

class HomepagesUserState extends State<HomepagesUser> {
  final navKey = GlobalKey<CurvedNavigationBarState>();
  dynamic token_local = null;
  String device_info = '';

  @override
  void initState() {
    super.initState();
    Provider.of<NotificationService>(context, listen: false).initialize();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      AndroidInitializationSettings androidInitializationSettings =
          const AndroidInitializationSettings("ic_launcher");

      IOSInitializationSettings iosInitializationSettings =
          const IOSInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: androidInitializationSettings,
              iOS: iosInitializationSettings);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      var android = const AndroidNotificationDetails("id", "channel");

      var ios = const IOSNotificationDetails();

      var platform = NotificationDetails(android: android, iOS: ios);

      await flutterLocalNotificationsPlugin.show(message.notification.hashCode,
          message.notification?.title, message.notification?.body, platform,
          payload: "Welcome to demo app");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      AndroidInitializationSettings androidInitializationSettings =
          const AndroidInitializationSettings("ic_launcher");

      IOSInitializationSettings iosInitializationSettings =
          const IOSInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: androidInitializationSettings,
              iOS: iosInitializationSettings);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      var android = const AndroidNotificationDetails("id", "channel");

      var ios = const IOSNotificationDetails();

      var platform = NotificationDetails(android: android, iOS: ios);

      await flutterLocalNotificationsPlugin.show(event.notification.hashCode,
          event.notification?.title, event.notification?.body, platform,
          payload: "Welcome to demo app");
    });

    if (mounted) {
      checkToken();
    }
  }

  checkToken() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    if (mounted) {
      setState(() {
        token_local = token;
      });
    }
    if (token != null) {
      await ApiCallsGetData().getUserData();
      if (mounted) {
        setState(() {});
      }
    } else {
      getDeviceInfo();
    }
  }

  getDeviceInfo() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (mounted) {
      setState(() {
        device_info = '${androidInfo.model}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: token_local == null
                  ? UIHomePage(
                      device_info: device_info,
                    )
                  : const UserDataHomepages(),
            ),
            UserDataGetStarted(navKey: navKey),
            const WasteCategories(),
            const StatisticUsers(),
            const NewsApiUsers()
          ],
        ),
      ),
    );
  }
}
