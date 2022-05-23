import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/ongoing_message/ongoingMessage_widget.dart';

class OngoingMessages extends StatefulWidget {
  const OngoingMessages({Key? key}) : super(key: key);

  @override
  OngoingMessagesState createState() => OngoingMessagesState();
}

class OngoingMessagesState extends State<OngoingMessages> {
  int index = 0;
  bool isChat = true;
  bool isInbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/heading.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            const OngoingMessageWidget(),
            Padding(
              padding: defaultPadding10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TouchableOpacity(
                      onTap: () => setState(() => index = 0),
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: index == 0 ? 0.0 : 1.0,
                                color: index == 0
                                    ? Colors.transparent
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(16.7),
                            gradient: index == 0
                                ? const LinearGradient(colors: [
                                    Color(0xFFF8C503),
                                    Color(0xFFFFE067)
                                  ])
                                : null,
                            boxShadow: [
                              BoxShadow(
                                  color: index == 0
                                      ? Colors.grey
                                      : Colors.transparent,
                                  blurRadius: index == 0 ? 2 : 0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Center(
                          child: Text('Active',
                              style: index == 0
                                  ? textProfileBoldWhite
                                  : textProfileWhite),
                        ),
                      )),
                  TouchableOpacity(
                      onTap: () => setState(() => index = 1),
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: index == 1 ? 0.0 : 1.0,
                                color: index == 1
                                    ? Colors.transparent
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(16.7),
                            gradient: index == 1
                                ? const LinearGradient(colors: [
                                    Color(0xFFF8C503),
                                    Color(0xFFFFE067)
                                  ])
                                : null,
                            boxShadow: [
                              BoxShadow(
                                  color: index == 1
                                      ? Colors.grey
                                      : Colors.transparent,
                                  blurRadius: index == 1 ? 2 : 0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Center(
                          child: Text('History',
                              style: index == 1
                                  ? textProfileBoldWhite
                                  : textProfileWhite),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      if (index == 0) ...[
        Container(
          transform: Matrix4.translationValues(0.0, -20.0, 0.0),
          height: 650,
          child: const ActiveList(),
        )
      ] else ...[
        Container(
          transform: Matrix4.translationValues(0.0, -20.0, 0.0),
          height: 650,
          child: const InboxList(),
        )
      ]
    ]));
  }
}
