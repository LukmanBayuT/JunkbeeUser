// ignore_for_file: file_names, sized_box_for_whitespace, camel_case_types, avoid_print, unnecessary_const, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class ShareFeedbackWidget extends StatelessWidget {
  const ShareFeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 40),
        width: MediaQuery.of(context).size.width,
        height: 280,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            color: Color(0xFFF8C503),
            // ignore: unnecessary_const
            image: const DecorationImage(
                image: const AssetImage('assets/mask_group_31.png'),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(children: [
                TouchableOpacity(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/group_2211.png',
                        width: 20.2, height: 29.2)),
                Container(
                    width: 330,
                    alignment: Alignment.center,
                    child:
                        const Text('Share Feedback', style: textBodyProfile)),
                Container(width: 20.2, height: 29.2)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: const Text(
                  'Every Feedback helps. \nWhat can we improve on?',
                  style: textProfileMediumWhite,
                  textAlign: TextAlign.center))
        ]));
  }
}

class multipleTextInput extends StatelessWidget {
  const multipleTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(0.0, -40.0, 0.0),
        child: Column(
          children: [
            Container(
                width: 400,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: const Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.circular(16.7)),
                child: Container(
                  width: 380,
                  child: TextFormField(
                    style: const TextStyle(
                        color: Color(0xFF707070),
                        fontFamily: 'DiodrumCyrillic',
                        fontSize: 18),
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(
                            color: Color(0xFF707070),
                            fontFamily: 'DiodrumCyrillic',
                            fontSize: 18),
                        hintText: 'Tell us your thought',
                        border: InputBorder.none),
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 90),
              child: TouchableOpacity(
                  onTap: () => print('send feedback'),
                  child: Container(
                    width: 380,
                    height: 75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8C503),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              spreadRadius: 0.0,
                              offset: Offset(0, 1))
                        ]),
                    child: const Text(
                      'Send Feedback',
                      style: textBodyProfile,
                    ),
                  )),
            )
          ],
        ));
  }
}
