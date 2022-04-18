import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:lottie/lottie.dart';

final SecureStorage secureStorage = SecureStorage();

class OnboardingSplashScreen extends StatefulWidget {
  const OnboardingSplashScreen({Key? key}) : super(key: key);

  @override
  _OnboardingSplashScreenState createState() => _OnboardingSplashScreenState();
}

class _OnboardingSplashScreenState extends State<OnboardingSplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  void startLaunching() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var authRole = await secureStorage.readSecureData('role');
    var role = authRole;

    if (token == null) {
      var duration = const Duration(seconds: 2);
      Timer(duration, () {
        Get.offAll(() => const NavigatorUser());
      });
    } else if (token != null && role == 'user') {
      var duration = const Duration(seconds: 2);
      Timer(duration, () {
        Get.offAll(() => const NavigatorUser());
      });
    } else if (token != null && role == 'beever') {
      var duration = const Duration(seconds: 2);
      Timer(duration, () {
        Get.offAll(() => const NavigatorPages());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets_animations/bee_loading.json",
            width: MediaQuery.of(context).size.height * 1,
            height: MediaQuery.of(context).size.height * 1,
            animate: true),
      ),
    );
  }
}
