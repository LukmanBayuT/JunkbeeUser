import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';

class OnboardingUser1 extends StatelessWidget {
  const OnboardingUser1({
    Key? key,
    required this.onboardingUserController,
  }) : super(key: key);

  final PageController onboardingUserController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: defaultPadding4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Column(
              children: [
                Image.asset('assets_onboarding/1.png'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                const Text(
                  'Transform Your Waste',
                  style: onboardingTextStyleTitle,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    'Receive cash by recycling your waste anytime, anywhere.',
                    style: onboardingTextStyleBody,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => onboardingUserController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInCubic),
                    child: const Text(
                      'Skip',
                      style: onboardingTextStyleSkipDone,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onboardingUserController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInCubic),
                    child: const Text(
                      'Next',
                      style: onboardingTextStyleSkipDone,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingUser2 extends StatelessWidget {
  const OnboardingUser2({
    Key? key,
    required this.onboardingUserController,
  }) : super(key: key);

  final PageController onboardingUserController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: defaultPadding4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Column(
              children: [
                Image.asset('assets_onboarding/2.png'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                const Text(
                  'Real Time Collection',
                  style: onboardingTextStyleTitle,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    'Get your waste picked up by curated drivers through the app.',
                    style: onboardingTextStyleBody,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '',
                    style: onboardingTextStyleSkipDone,
                  ),
                  GestureDetector(
                    onTap: () => onboardingUserController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInCubic),
                    child: const Text(
                      'Next',
                      style: onboardingTextStyleSkipDone,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingUser3 extends StatelessWidget {
  const OnboardingUser3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: defaultPadding4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Column(
              children: [
                Image.asset('assets_onboarding/3.png'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                const Text(
                  'Instant Payment',
                  style: onboardingTextStyleTitle,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    'Receive cashless payment through our wallet system.',
                    style: onboardingTextStyleBody,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, shape: roundedRectBor),
                  child: const Text('Get Started', style: onboardingGetStarted),
                  onPressed: () {
                    Get.offAll(() => const NavigatorUser());
                  },
                )),
          ],
        ),
      ),
    );
  }
}
