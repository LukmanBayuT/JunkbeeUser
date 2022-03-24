import 'package:flutter/material.dart';

import 'package:junkbee_user/beever/widgets/onboarding_widgets.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final onboardingController = PageController(initialPage: 0);

  @override
  void dispose() {
    onboardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: onboardingController,
          children: [
            Onboarding_1(onboardingController: onboardingController),
            Onboarding_2(onboardingController: onboardingController),
          ],
        ),
      ),
    );
  }
}
