// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/widgets/home/History_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
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
                          child: const HistoryWidget()),
                      Container(
                          transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                          width: ScreenUtil().setWidth(480),
                          height: ScreenUtil().setHeight(740),
                          alignment: Alignment.topCenter,
                          child: const HistoryList())
                    ],
                  ),
                ),
              ),
            )));
  }
}
