import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/onboarding_screen/onboarding_screen.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:lottie/lottie.dart';

class OnboardingSplashScreen extends StatefulWidget {
  const OnboardingSplashScreen({Key? key}) : super(key: key);

  @override
  _OnboardingSplashScreenState createState() => _OnboardingSplashScreenState();
}

class _OnboardingSplashScreenState extends State<OnboardingSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (1)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets_animations/booble.json",
          width: 250,
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => Get.offAll(() => const NavigatorUser()));
          },
        ),
      ),
    );
  }
}
