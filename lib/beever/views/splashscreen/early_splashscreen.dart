import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/views/onboarding/onboarding.dart';
import 'package:lottie/lottie.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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

  void startLaunching() async {
    final SecureStorage secureStorage = SecureStorage();
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    
    if (token != null) {
      print('token is not null');
      Get.offAll(() => const NavigatorPages());
    } else {
      print('token is null');
      Get.offAll(() => const OnboardingPages());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          "https://assets1.lottiefiles.com/packages/lf20_AMggr5.json",
          width: 150,
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => startLaunching() );
          },
        ),
      ),
    );
  }
}
