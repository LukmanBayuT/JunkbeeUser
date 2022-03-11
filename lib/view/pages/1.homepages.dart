// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:junkbee_user/widget/homepages_news_api.dart';
import 'package:junkbee_user/widget/homepages_user_statistic.dart';
import 'package:junkbee_user/widget/homepages_widget_get_started.dart';
import 'package:junkbee_user/widget/homepages_widget_userdata.dart';
import 'package:junkbee_user/widget/homepages_widget_wastecategories.dart';

class HomepagesUser extends StatefulWidget {
  const HomepagesUser({Key? key}) : super(key: key);

  @override
  _HomepagesUserState createState() => _HomepagesUserState();
}

class _HomepagesUserState extends State<HomepagesUser> {
  final navKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserDataHomepages(),
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
