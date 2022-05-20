import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:lottie/lottie.dart';

class SignInSplashScreen extends StatefulWidget {
  SignInSplashScreen({Key? key}) : super(key: key);
  final SecureStorage secureStorage = SecureStorage();
  @override
  SignInSplashScreenState createState() => SignInSplashScreenState();
}

class SignInSplashScreenState extends State<SignInSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (3)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/animation/booble.json",
          width: 250,
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward()
                  .whenComplete(() => Get.offAll(() => const NavigatorPages()));
          },
        ),
      ),
    );
  }
}
