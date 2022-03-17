import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AvailableWidget extends StatelessWidget {
  const AvailableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(480),
        height: ScreenUtil().setHeight(80),
        alignment: Alignment.topCenter,
        child: Container(
          width: ScreenUtil().setWidth(430),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().setWidth(40),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TouchableOpacity(
                      onTap: () => Navigator.pop(context, true),
                      child: Image.asset(
                        'assets/group_2211.png',
                        width: ScreenUtil().setWidth(15.2),
                        height: ScreenUtil().setHeight(24.2),
                      ),
                    )),
              ),
              Container(
                width: ScreenUtil().setWidth(350),
                alignment: Alignment.center,
                child: const Text('Available Pick Up', style: textBodyProfile),
              ),
              Container(
                width: ScreenUtil().setWidth(40),
              )
            ],
          ),
        ));
  }
}

class AvailableList extends StatelessWidget {
  const AvailableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: const Offset(0, 1))
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
                          border: Border(
                              bottom: const BorderSide(
                                  width: 1.0, color: const Color(0xFFDEDEDE)))),
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
                height: ScreenUtil().setHeight(30),
              )
            ],
          );
        });
  }
}
