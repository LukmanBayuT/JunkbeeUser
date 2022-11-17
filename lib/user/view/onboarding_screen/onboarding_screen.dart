import 'package:flutter/material.dart';
import 'package:junkbee_user/user/widget/onboarding_widgets.dart';

class OnboardingUser extends StatefulWidget {
  const OnboardingUser({Key? key}) : super(key: key);

  @override
  State<OnboardingUser> createState() => _OnboardingUserState();
}

class _OnboardingUserState extends State<OnboardingUser> {
  final onboardingUserController = PageController(initialPage: 0);

  @override
  void dispose() {
    onboardingUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: onboardingUserController,
          children: [
            OnboardingUser1(onboardingUserController: onboardingUserController),
            OnboardingUser2(onboardingUserController: onboardingUserController),
            const OnboardingUser3(),
          ],
        ),
      ),
    );
  }
}
