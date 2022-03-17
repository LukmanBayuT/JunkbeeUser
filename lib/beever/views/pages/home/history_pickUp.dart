import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/widgets/home/History_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

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
      designSize: Size(480, 904),
      builder: () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(480),
                    height: ScreenUtil().setHeight(230),
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/heading.png'), fit: BoxFit.fill)
                    ),
                    child: HistoryWidget()
                  ),

                  Container(
                    transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                    width: ScreenUtil().setWidth(480),
                    height: ScreenUtil().setHeight(740),
                    alignment: Alignment.topCenter,
                    child: HistoryList()
                  )
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}