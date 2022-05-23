// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/profile/shareFeedback_widget.dart';

class ShareFeedback extends StatefulWidget {
  const ShareFeedback({Key? key}) : super(key: key);

  @override
  ShareFeedbackState createState() => ShareFeedbackState();
}

class ShareFeedbackState extends State<ShareFeedback> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const ShareFeedbackWidget(),
      Container(
          transform: Matrix4.translationValues(0.0, -70.0, 0.0),
          alignment: Alignment.center,
          child: Column(children: [
            Container(
                width: 220,
                height: 220,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 2.0, color: const Color(0xFF2AAE1B)),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset('assets/group_241.png', width: 170)),
            const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Beever',
                  style: textSemiBold,
                ))
          ])),
      const multipleTextInput()
    ])));
  }
}
