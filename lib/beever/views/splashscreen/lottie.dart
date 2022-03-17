import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimLoad extends StatelessWidget {
  const LottieAnimLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_AMggr5.json",
            width: 150,
            height: 150),
      ),
    );
  }
}
