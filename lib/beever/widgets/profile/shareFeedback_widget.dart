import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class ShareFeedbackWidget extends StatelessWidget {
  const ShareFeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      width: ScreenUtil().setWidth(480),
      height: ScreenUtil().setHeight(280),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Color(0xFFF8C503),
        image: DecorationImage(image: AssetImage('assets/mask_group_31.png'), fit: BoxFit.cover),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
      ),
      child: Column(
        children: [
          Container(
            width: ScreenUtil().setWidth(430),
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(40),
                  child: TouchableOpacity(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/group_2211.png', width: ScreenUtil().setWidth(20.2), height: ScreenUtil().setHeight(29.2),)
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(350),
                  alignment: Alignment.center,
                  child: Text('Share Feedback', style: textBodyProfile,),
                ),
                Container(
                  width: ScreenUtil().setWidth(40),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: ScreenUtil().setWidth(220),
            alignment: Alignment.center,
            child: Text('Every Feedback helps. What can we improve on?', style: textProfileMediumWhite, textAlign: TextAlign.center,),
          )
        ],
      )
    );
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
            width: ScreenUtil().setWidth(400),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(16.7)
            ),
            child: Container(
              width: ScreenUtil().setWidth(380),
              child: TextFormField(
                style: TextStyle( color: Color(0xFF707070), fontFamily: 'DiodrumCyrillic', fontSize: 18.sp ),
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xFF707070), fontFamily: 'DiodrumCyrillic', fontSize: 18.sp),
                  hintText: 'Tell us your thought',
                  border: InputBorder.none
                ),
              ),
            )
          ),

          Container(
            padding: const EdgeInsets.only(top: 90),
            child: TouchableOpacity(
              onTap: () => print('send feedback'),
              child: Container(
                width: ScreenUtil().setWidth(380),
                height: ScreenUtil().setHeight(75),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF8C503),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
                ),
                child: Text('Send Feedback', style: textBodyProfile,),
              )
            ),
          )
        ],
      )
    );
  }
}