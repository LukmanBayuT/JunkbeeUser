import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/ongoing_message/ongoingMessage_widget.dart';

class OngoingMessages extends StatefulWidget {
  const OngoingMessages({Key? key}) : super(key: key);

  @override
  _OngoingMessagesState createState() => _OngoingMessagesState();
}

class _OngoingMessagesState extends State<OngoingMessages> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 854),
      builder: () => Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                width: ScreenUtil().setWidth(480),
                height: ScreenUtil().setHeight(200),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/heading.png'), fit: BoxFit.fill)),
                child: Column(
                  children: [
                    OngoingMessageWidget(),
                    Padding(
                      padding: defaultPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TouchableOpacity(
                            onTap: () => setState(() => index = 0),
                            child: Container(
                              width: ScreenUtil().setWidth(150),
                              height: ScreenUtil().setHeight(60),
                              decoration: BoxDecoration(
                                border: Border.all(width: index == 0 ? 0.0 : 1.0, color: index == 0 ? Colors.transparent : Colors.white),
                                borderRadius: BorderRadius.circular(16.7),
                                gradient: index == 0 ? LinearGradient(
                                  colors: [ Color(0xFFF8C503), Color(0xFFFFE067) ]
                                ) : null,
                                boxShadow: [BoxShadow(color: index == 0 ? Colors.grey : Colors.transparent, blurRadius: index == 0 ? 2 : 0, spreadRadius: 0.0, offset: Offset(0, 1))]
                              ),
                              child: Center(
                                child: Text('Active', style: index == 0 ? textProfileBoldWhite : textProfileWhite),
                              ),
                            )
                          ),

                          TouchableOpacity(
                            onTap: () => setState(() => index = 1),
                            child: Container(
                              width: ScreenUtil().setWidth(150),
                              height: ScreenUtil().setHeight(60),
                              decoration: BoxDecoration(
                                border: Border.all(width: index == 1 ? 0.0 : 1.0, color: index == 1 ? Colors.transparent : Colors.white),
                                borderRadius: BorderRadius.circular(16.7),
                                gradient: index == 1 ? LinearGradient(
                                  colors: [ Color(0xFFF8C503), Color(0xFFFFE067) ]
                                ) : null,
                                boxShadow: [BoxShadow(color: index == 1 ? Colors.grey : Colors.transparent, blurRadius: index == 1 ? 2 : 0, spreadRadius: 0.0, offset: Offset(0, 1))]
                              ),
                              child: Center(
                                child: Text('History', style: index == 1 ? textProfileBoldWhite : textProfileWhite),
                              ),
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              if (index == 0) ...[
                Container(
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  height: ScreenUtil().setHeight(650),
                  child: ActiveList(),
                )
              ] else ...[
                Container(
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  height: ScreenUtil().setHeight(650),
                  child: InboxList(),
                )
              ]
            ],
          )
        ),
      )
    );
  }
}
