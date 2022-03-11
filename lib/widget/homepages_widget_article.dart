import 'package:flutter/material.dart';
import 'package:junkbee_user/constant/constant.dart';

class ArticleJunkbee extends StatelessWidget {
  const ArticleJunkbee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4.2,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Article1(),
            Article2(),
            Article3(),
          ],
        ),
      ),
    );
  }
}

class Article1 extends StatelessWidget {
  const Article1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          shape: roundedRectBor,
          child: Stack(
            children: [
              Image.asset('assets/BG_info.png'),
              Positioned(
                  top: MediaQuery.of(context).size.height / 17,
                  right: MediaQuery.of(context).size.width / 25,
                  child: Image.asset(
                    'assets_onboarding/1.png',
                    width: MediaQuery.of(context).size.width / 5,
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 20,
                child: const Text(
                  'What is Junkbee?',
                  style: bodySlimBodyUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Article2 extends StatelessWidget {
  const Article2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding4,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          shape: roundedRectBor,
          child: Stack(
            children: [
              Image.asset('assets/BG_info.png'),
              Positioned(
                  top: MediaQuery.of(context).size.height / 17,
                  right: MediaQuery.of(context).size.width / 25,
                  child: Image.asset(
                    'assets_onboarding/1.png',
                    width: MediaQuery.of(context).size.width / 5,
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 20,
                child: const Text(
                  'What is Junkbee?',
                  style: bodySlimBodyUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Article3 extends StatelessWidget {
  const Article3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding4,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          shape: roundedRectBor,
          child: Stack(
            children: [
              Image.asset('assets/BG_info.png'),
              Positioned(
                  top: MediaQuery.of(context).size.height / 17,
                  right: MediaQuery.of(context).size.width / 25,
                  child: Image.asset(
                    'assets_onboarding/1.png',
                    width: MediaQuery.of(context).size.width / 5,
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 20,
                child: const Text(
                  'What is Junkbee?',
                  style: bodySlimBodyUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
