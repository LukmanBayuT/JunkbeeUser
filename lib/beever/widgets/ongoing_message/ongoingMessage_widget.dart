import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class OngoingMessageWidget extends StatelessWidget {
  const OngoingMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding11,
      child: Text('Collection Status', style: textBodyProfile,),
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
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
              ),
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
                          child: Text('Order From Cynthia', style: textProfileBoldMini,),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          alignment: Alignment.centerRight,
                          child: Text('1 hour ago', style: textProfile,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.5),
                    width: ScreenUtil().setWidth(390),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 17),
                    width: ScreenUtil().setWidth(390),
                    child: Row(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(40),
                          child: Image.asset('assets/group_971.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setHeight(30),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: ScreenUtil().setWidth(350),
                          child: Column(
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(350),
                                child: Text('Pick Up Location', style: textProfile,),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 1),
                                width: ScreenUtil().setWidth(350),
                                child: Text('Tugumuda, 50171 Semarang', style: textProfileBoldMini,),
                              )
                            ],
                          )
                        )
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
                          child: Image.asset('assets/group_2267.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setHeight(30),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: ScreenUtil().setWidth(350),
                          child: Column(
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(350),
                                child: Text('Paper     0.5 kg', style: textProfile,),
                              )
                            ],
                          )
                        )
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
      }
    );
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
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
              ),
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
                          child: Text('Order From Cynthia', style: textProfileBoldMini,),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          alignment: Alignment.centerRight,
                          child: Text('1 hour ago', style: textProfile,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.5),
                    width: ScreenUtil().setWidth(390),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 17),
                    width: ScreenUtil().setWidth(390),
                    child: Row(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(40),
                          child: Image.asset('assets/group_971.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setHeight(30),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: ScreenUtil().setWidth(350),
                          child: Column(
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(350),
                                child: Text('Pick Up Location', style: textProfile,),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 1),
                                width: ScreenUtil().setWidth(350),
                                child: Text('Tugumuda, 50171 Semarang', style: textProfileBoldMini,),
                              )
                            ],
                          )
                        )
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
                          child: Image.asset('assets/group_2267.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setHeight(30),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: ScreenUtil().setWidth(350),
                          child: Column(
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(350),
                                child: Text('Paper     0.5 kg', style: textProfile,),
                              )
                            ],
                          )
                        )
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
      }
    );
  }
}