import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/widgets/home/available_widget.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/views/pages/home/available_pickUp.dart';

class AvailableScreen extends StatefulWidget {
  const AvailableScreen({Key? key}) : super(key: key);

  _AvailableState createState() => _AvailableState();
}

class _AvailableState extends State<AvailableScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 904),
        builder: () => Scaffold(
                body: SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(480),
                          height: ScreenUtil().setHeight(230),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/heading.png'),
                                  fit: BoxFit.fill)),
                          child: const AvailableWidget()),
                      Container(
                          transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                          width: ScreenUtil().setWidth(480),
                          height: ScreenUtil().setHeight(740),
                          alignment: Alignment.topCenter,
                          child: const AvailableList())
                    ],
                  ),
                ),
              ),
            )));
  }
}
