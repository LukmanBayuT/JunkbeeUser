// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/views/signin/sign_in.dart';

class Onboarding_1 extends StatelessWidget {
  const Onboarding_1({
    Key? key,
    required this.onboardingController,
  }) : super(key: key);

  final PageController onboardingController;

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
            Row(
              children: [
                Image.asset('assets/onboarding/close_onboarding.png', height: MediaQuery.of(context).size.height / 40),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/onboarding/onboarding_1.png', width: MediaQuery.of(context).size.width / 1.2),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                const Text( 'With Junkbee', style: onboardingTextStyleTitle ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    'From the hours you work to the money you earn is completely up to you!',
                    style: onboardingTextStyleBody,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 13,
              child: ElevatedButton(
                onPressed: () => onboardingController.animateToPage(1, duration: onboardingSlideDuration, curve: Curves.easeInCubic),
                child: const Text('Be a Beever', style: onboardingTextButton,),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class Onboarding_2 extends StatelessWidget {
  const Onboarding_2({
    Key? key,
    required this.onboardingController,
  }) : super(key: key);

  final PageController onboardingController;

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
            Row(
              children: [
                IconButton(
                  onPressed: () => onboardingController.animateToPage(0, duration: onboardingSlideDuration, curve: Curves.easeInCubic),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.amber,
                  )
                )
              ],
            ),
            Column(
              children: [
                Image.asset('assets/onboarding/onboarding_2.png', width: MediaQuery.of(context).size.width / 1.4,),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                const Text('Verify Your Identity', style: onboardingTextStyleTitle),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    'Before you get started, we need to confirm your identity',
                    style: onboardingTextStyleBody,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 13,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignInDriver());
                },
                child: const Text('Continue', style: onboardingTextButton),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
