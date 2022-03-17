import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/profile/shareFeedback_widget.dart';

class ShareFeedback extends StatefulWidget {
  const ShareFeedback({Key? key}) : super(key: key);

  _ShareFeedbackState createState() => _ShareFeedbackState();
}

class _ShareFeedbackState extends State<ShareFeedback> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 904),
      builder: () => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: ScreenUtil().setWidth(480),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ShareFeedbackWidget(),
                Container(
                  transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                  child: Column(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(220),
                        height: ScreenUtil().setHeight(220),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Color(0xFF2AAE1B)),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset('assets/group_241.png', width: ScreenUtil().setWidth(170),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Beever', style: textSemiBold,)
                      )
                    ],
                  ),
                ),
                multipleTextInput()
              ],
            )
          ),
        ),
      )
    );
  }
}