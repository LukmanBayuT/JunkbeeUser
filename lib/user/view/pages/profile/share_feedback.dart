// ignore_for_file: unused_import, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class ShareFeedback extends StatefulWidget {
  const ShareFeedback({Key? key}) : super(key: key);

  @override
  ShareFeedbackState createState() => ShareFeedbackState();
}

class ShareFeedbackState extends State<ShareFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/mask_group_30.png'),
                  fit: BoxFit.cover)),
          alignment: Alignment.topCenter,
          child: Column(children: [
            Container(
                padding: const EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width / 1.15,
                child: Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 5,
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 25, color: Colors.white))),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.13,
                      alignment: Alignment.center,
                      child: const Text('Share Feedback',
                          style: bodyBodyUserBold)),
                  Container(width: MediaQuery.of(context).size.width / 5)
                ])),
            Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width / 1.15,
                child: const Text(
                    'Every Feedback helps. \nWhat can we improve on?',
                    style: bodyBodyMini,
                    textAlign: TextAlign.center))
          ])),
      Container(
          transform: Matrix4.translationValues(0, -90, 0),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2.5, color: const Color(0xFF2AAE1B)),
              borderRadius: BorderRadius.circular(16)),
          child: Image.asset('assets/group_241.png',
              width: MediaQuery.of(context).size.width / 2.5)),
      Container(
          transform: Matrix4.translationValues(0, -75, 0),
          child: const Text('User', style: bodyBodySemi)),
      Container(
          transform: Matrix4.translationValues(0, -50, 0),
          width: MediaQuery.of(context).size.width / 1.12,
          decoration: BoxDecoration(
              color: const Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.center,
          child: Container(
              width: MediaQuery.of(context).size.width / 1.23,
              child: TextFormField(
                  style: bodyBody,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintStyle: bodyBody,
                      hintText: 'Tell us your throught',
                      border: InputBorder.none)))),
      Container(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 12,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, shape: roundedRectBor),
                  child:
                      const Text('Send Feedback', style: onboardingGetStarted),
                  onPressed: () {
                    print('send feedback');
                  })))
    ])));
  }
}
