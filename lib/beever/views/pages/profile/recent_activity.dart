import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  _RecentActivityState createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  List<String> what_happen = [
    'Something wrong with this order',
    'About fee transaction',
    'Others.'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 853),
        builder: () => Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF8C503),
              title: const Text('What Happening?', style: textBodyProfile),
              centerTitle: true,
              leading: TouchableOpacity(
                  onTap: () => Navigator.pop(context),
                  child:
                      const Icon(Icons.arrow_back_ios_new_rounded, size: 25)),
            ),
            body: SingleChildScrollView(
                child: Container(
                    width: ScreenUtil().setWidth(480),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: what_happen.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      width: ScreenUtil().setWidth(480),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        width: ScreenUtil().setWidth(400),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                what_happen[index],
                                                style: textProfile,
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider())),
                        Container(
                            width: ScreenUtil().setWidth(400),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xFFDEDEDE)),
                                borderRadius: BorderRadius.circular(16.7)),
                            child: Container(
                              width: ScreenUtil().setWidth(380),
                              child: TextFormField(
                                style: TextStyle(
                                    color: const Color(0xFF707070),
                                    fontFamily: 'DiodrumCyrillic',
                                    fontSize: 18.sp),
                                keyboardType: TextInputType.multiline,
                                maxLines: 6,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: const Color(0xFF707070),
                                        fontFamily: 'DiodrumCyrillic',
                                        fontSize: 18.sp),
                                    hintText: 'Describe your reason',
                                    border: InputBorder.none),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 100),
                            child: TouchableOpacity(
                                child: Container(
                              width: ScreenUtil().setWidth(222),
                              height: ScreenUtil().setHeight(80),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF8C503),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        spreadRadius: 0.0,
                                        offset: const Offset(0, 1))
                                  ]),
                              alignment: Alignment.center,
                              child: const Text(
                                'Submit',
                                style: textBodyProfile,
                              ),
                            )))
                      ],
                    )))));
  }
}
