// ignore_for_file: file_names, unused_import, unnecessary_const, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class OngoingMessageWidget extends StatelessWidget {
  const OngoingMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: defaultPadding11,
      child: const Text(
        'Collection Status',
        style: textBodyProfile,
      ),
    );
  }
}

class ActiveList extends StatelessWidget {
  const ActiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 70),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: ScreenUtil().setWidth(420),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: ScreenUtil().setWidth(390),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(40),
                            child: Image.asset('assets/group_2262.png'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: ScreenUtil().setWidth(250),
                            child: const Text(
                              'Order From Cynthia',
                              style: textProfileBoldMini,
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(100),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              '1 hour ago',
                              style: textProfile,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.5),
                      width: ScreenUtil().setWidth(390),
                      decoration: const BoxDecoration(
                          border: const Border(
                              bottom: const BorderSide(
                                  width: 1.0, color: Color(0xFFDEDEDE)))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: ScreenUtil().setWidth(390),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(40),
                            child: Image.asset(
                              'assets/group_971.png',
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setHeight(30),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: ScreenUtil().setWidth(350),
                              child: Column(
                                children: [
                                  Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: const Text(
                                      'Pick Up Location',
                                      style: textProfile,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 1),
                                    width: ScreenUtil().setWidth(350),
                                    child: const Text(
                                      'Tugumuda, 50171 Semarang',
                                      style: textProfileBoldMini,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17, bottom: 29),
                      width: ScreenUtil().setWidth(390),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(40),
                            child: Image.asset(
                              'assets/group_2267.png',
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setHeight(30),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: ScreenUtil().setWidth(350),
                              child: Column(
                                children: [
                                  Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: const Text(
                                      'Paper     0.5 kg',
                                      style: textProfile,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(15),
              )
            ],
          );
        });
  }
}

class InboxList extends StatelessWidget {
  const InboxList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 70),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: ScreenUtil().setWidth(420),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: ScreenUtil().setWidth(390),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(40),
                            child: Image.asset('assets/group_2262.png'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: ScreenUtil().setWidth(250),
                            child: const Text(
                              'Order From Cynthia',
                              style: textProfileBoldMini,
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(100),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              '1 hour ago',
                              style: textProfile,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.5),
                      width: ScreenUtil().setWidth(390),
                      decoration: const BoxDecoration(
                          border: const Border(
                              bottom: const BorderSide(
                                  width: 1.0, color: Color(0xFFDEDEDE)))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: ScreenUtil().setWidth(390),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(40),
                            child: Image.asset(
                              'assets/group_971.png',
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setHeight(30),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: ScreenUtil().setWidth(350),
                              child: Column(
                                children: [
                                  Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: const Text(
                                      'Pick Up Location',
                                      style: textProfile,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 1),
                                    width: ScreenUtil().setWidth(350),
                                    child: const Text(
                                      'Tugumuda, 50171 Semarang',
                                      style: textProfileBoldMini,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17, bottom: 29),
                      width: ScreenUtil().setWidth(390),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(40),
                            child: Image.asset(
                              'assets/group_2267.png',
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setHeight(30),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: ScreenUtil().setWidth(350),
                              child: Column(
                                children: [
                                  Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: const Text(
                                      'Paper     0.5 kg',
                                      style: textProfile,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(15),
              )
            ],
          );
        });
  }
}
