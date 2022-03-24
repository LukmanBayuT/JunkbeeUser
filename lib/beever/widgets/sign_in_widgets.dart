import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';

class LogoType extends StatelessWidget {
  const LogoType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: defaultPadding12,
          child: Image.asset('assets/onboarding/logo_junkbee.png', height: MediaQuery.of(context).size.height / 5.5),
        ),
        const Padding(
          padding: defaultPadding7,
          child: Text('Beever App', style: onboardingTextStyleSkipDone),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          const Text('Forgot Password?', style: signScreenTextStyle)
        ],
      ),
    );
  }
}

// Padding GoogleAndFBLogin(BuildContext context) {
//   return Padding(
//     padding: defaultPadding4,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Image.asset('assets/facebook_icon.png', height: MediaQuery.of(context).size.height / 15),
//         Image.asset('assets/google_icon.png', height: MediaQuery.of(context).size.height / 15),
//       ],
//     ),
//   );
// }

class BecomeABeever extends StatelessWidget {
  const BecomeABeever({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding4,
      child: Column(
        children: const [
          Text('Dont have account yet?', style: signScreenTextStyle),
          Text('To become our beever please contact us', style: signScreenTextStyle),
        ],
      ),
    );
  }
}
