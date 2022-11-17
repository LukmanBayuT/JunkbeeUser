// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:junkbee_user/user/constant/constant.dart';
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
  _HomepagesUserState createState() => _HomepagesUserState();
}

class _HomepagesUserState extends State<HomepagesUser> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  dynamic token_local = null;
  String device_info = '';

  @override
  void initState() {
    super.initState();

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
            UserDataGetStarted(),
            const WasteCategories(),
            const StatisticUsers(),
            const NewsApiUsers()
          ],
        ),
      ),
    );
  }
}
