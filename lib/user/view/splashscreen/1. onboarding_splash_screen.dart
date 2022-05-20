import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/onboarding_screen/onboarding_screen.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:lottie/lottie.dart';

final SecureStorage secureStorage = SecureStorage();

class OnboardingSplashScreen extends StatefulWidget {
  const OnboardingSplashScreen({Key? key}) : super(key: key);

  @override
  OnboardingSplashScreenState createState() => OnboardingSplashScreenState();
}

class OnboardingSplashScreenState extends State<OnboardingSplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('sampesini');
    }
    startLaunching();
    if (kDebugMode) {
      print('selesai');
    }
  }

  void startLaunching() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var authRole = await secureStorage.readSecureData('role');
    var role = authRole;

    if (token == null) {
      var duration = const Duration(seconds: 2);
      Timer(duration, () {
        Get.offAll(() => const OnboardingUser());
        if (kDebugMode) {
          print('token kosong');
        }
      });
    } else if (token != null && role == 'user') {
      var duration = const Duration(seconds: 2);
      Timer(duration, () {
        Get.offAll(() => const NavigatorUser());
        if (kDebugMode) {
          print('token user');
        }
      });
    } else if (token != null && role == 'beever') {
      var duration = const Duration(seconds: 2);
      Timer(duration, () {
        Get.offAll(() => const NavigatorPages());
        if (kDebugMode) {
          print('token beever');
        }
      });
    } else {
      return Get.offAll(() => const OnboardingUser());
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
