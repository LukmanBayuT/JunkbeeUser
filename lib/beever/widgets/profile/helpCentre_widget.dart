// ignore_for_file: file_names, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_const, avoid_print

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class HelpCentreWidget extends StatelessWidget {
  const HelpCentreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/group_2239.png'), fit: BoxFit.cover)),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TouchableOpacity(
                    onTap: () => Navigator.pop(context, true),
                    child: Image.asset('assets/group_2211.png',
                        width: 15.2, height: 24.2)),
                Container(
                  width: 340,
                  alignment: Alignment.center,
                  child: const Text('Help Centre', style: textBodyProfile),
                ),
                Container(width: 15.2, height: 24.2)
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hi Joko,',
                            style: textProfileBoldWhiteMedium),
                        Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: const Text('We Are Ready',
                                style: textBodyProfile)),
                        Container(
                            padding: const EdgeInsets.only(top: 2),
                            child: const Text('To Help You',
                                style: textBodyProfile))
                      ],
                    ),
                    Container()
                  ]))
        ]));
  }
}

Container searchBar(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Container(
          width: 430,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(16.7)),
          child: Row(children: [
            Container(
                width: 40,
                alignment: Alignment.centerRight,
                child: Image.asset('assets/search_icon.png',
                    width: 22, height: 22)),
            Container(
                padding: const EdgeInsets.only(left: 10.5),
                width: 300,
                child: TextFormField(
                    style: textProfile,
                    decoration: const InputDecoration(
                        hintText: 'Search help',
                        hintStyle: textProfile,
                        border: InputBorder.none)))
          ])));
}

Container Topics(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 29, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('All Topics', style: textProfileBold),
        Container(
            padding: const EdgeInsets.only(top: 24),
            child: TouchableOpacity(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const Text('Frequently Asked Questions', style: textProfile),
                  Image.asset('assets/union_68.png', width: 15, height: 15)
                ]))),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),
        Container(
            padding: const EdgeInsets.only(top: 18),
            child: TouchableOpacity(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const Text('Payment Issue', style: textProfile),
                  Image.asset('assets/union_68.png', width: 15, height: 15)
                ]))),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),
        Container(
            padding: const EdgeInsets.only(top: 18),
            child: TouchableOpacity(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const Text('About My Account', style: textProfile),
                  Image.asset('assets/union_68.png', width: 15, height: 15)
                ]))),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: const BoxDecoration(
              border: const Border(
                  bottom:
                      BorderSide(width: 1.0, color: const Color(0xFFDEDEDE)))),
        ),
        Container(
            padding: const EdgeInsets.only(top: 18),
            child: TouchableOpacity(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const Text('App Issue', style: textProfile),
                  Image.asset('assets/union_68.png', width: 15, height: 15)
                ]))),
        Container(
            padding: const EdgeInsets.only(bottom: 18),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: const BorderSide(
                        width: 1.0, color: const Color(0xFFDEDEDE)))))
      ]));
}

Container RecentActivity(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(bottom: 23),
          child: const Text('Need Help With Your Recent Activity?',
              style: textProfileBold),
        ),
        TouchableOpacity(
            onTap: () => print('Recent Activity'),
            child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: Offset(0, 1))
                    ]),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(
                          top: 17.7, bottom: 8.5, left: 10, right: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.0, color: Color(0xFFDEDEDE)))),
                      child: Row(children: [
                        Image.asset('assets/recycle_icon.png',
                            width: 34, height: 33),
                        Container(
                            padding: const EdgeInsets.only(left: 13),
                            child: const Text('Collection Successfully',
                                style: textProfileBoldMini))
                      ])),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 11, bottom: 16.7, left: 10, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('09:30 | 11 Jul 2021',
                                style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontFamily: 'DiodrumCyrillic',
                                    fontSize: 16)),
                            Text('Collection Nr.: 37432',
                                style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontFamily: 'DiodrumCyrillic',
                                    fontSize: 16))
                          ]))
                ])))
      ]));
}

Container MoreHelp(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 31, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(bottom: 23),
          child: const Text('Find More Help', style: textProfileBold),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 121,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/group_2237.png'),
                    fit: BoxFit.fill)),
            child: Row(children: [
              Container(
                width: 145,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  child: const Text('Still Need Help?',
                      style: textProfileBoldWhite),
                ),
                const Text('Fastest way to get help', style: textProfileWhite),
                Container(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    width: 158,
                    child: TouchableOpacity(
                        child: Container(
                            width: 158,
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: const Text('Chat With Us',
                                    style: textProfileBoldColor)))))
              ])
            ]))
      ]));
}

Container MailUS(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 21, bottom: 50),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Or you can', style: textProfile),
      TouchableOpacity(
          child: const Text(' MAIL US', style: textProfileSemiBoldYellow))
    ]),
  );
}
