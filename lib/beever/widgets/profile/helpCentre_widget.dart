import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/views/pages/profile/editProfile.dart';
import 'package:junkbee_user/beever/views/pages/profile/recent_activity.dart';

class HelpCentreWidget extends StatelessWidget {
  const HelpCentreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(480),
      height: ScreenUtil().setHeight(260),
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/group_2239.png'), fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 35),
            width: ScreenUtil().setWidth(430),
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TouchableOpacity(
                      onTap: () => Navigator.pop(context, true),
                      child: Image.asset('assets/group_2211.png', width: ScreenUtil().setWidth(15.2), height: ScreenUtil().setHeight(24.2),),
                    )
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(350),
                  alignment: Alignment.center,
                  child: Text('Help Centre', style: textBodyProfile),
                ),
                Container(
                  width: ScreenUtil().setWidth(40),
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 30),
            width: ScreenUtil().setWidth(430),
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(215),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(215),
                        child: Text('Hi Joko,', style: textProfileBoldWhiteMedium),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        width: ScreenUtil().setWidth(215),
                        child: Text('We Are Ready', style: textBodyProfile)
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 2),
                        width: ScreenUtil().setWidth(215),
                        child: Text('To Help You', style: textBodyProfile)
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(215),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container searchBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 25),
    width: ScreenUtil().setWidth(430),
    child: Container(
      width: ScreenUtil().setWidth(430),
      height: ScreenUtil().setHeight(60),
      decoration: BoxDecoration(color: Color(0xFFDEDEDE), borderRadius: BorderRadius.circular(16.7)
      ),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(40),
            alignment: Alignment.centerRight,
            child: Image.asset('assets/search_icon.png', width: ScreenUtil().setWidth(22), height: ScreenUtil().setHeight(22),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.5),
            width: ScreenUtil().setWidth(390),
            child: TextFormField(
              style: textProfile,
              decoration: const InputDecoration(
                hintText: 'Search help',
                hintStyle: textProfile,
                border: InputBorder.none
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Container Topics(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 29),
    width: ScreenUtil().setWidth(430),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('All Topics', style: textProfileBold),
        Container(
          padding: const EdgeInsets.only(top: 24),
          width: ScreenUtil().setWidth(430),
          child: TouchableOpacity(
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(400),
                  child: Text('Frequently Asked Questions', style: textProfile),
                ),
                Container(
                  width: ScreenUtil().setWidth(30),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/union_68.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),)
                )
              ],
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),
        Container(
          padding: const EdgeInsets.only(top: 18),
          width: ScreenUtil().setWidth(430),
          child: TouchableOpacity(
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(400),
                  child: Text('Payment Issue', style: textProfile),
                ),
                Container(
                  width: ScreenUtil().setWidth(30),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/union_68.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),)
                )
              ],
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),
        Container(
          padding: const EdgeInsets.only(top: 18),
          width: ScreenUtil().setWidth(430),
          child: TouchableOpacity(
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(400),
                  child: Text('About My Account', style: textProfile),
                ),
                Container(
                  width: ScreenUtil().setWidth(30),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/union_68.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),)
                )
              ],
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),
        Container(
          padding: const EdgeInsets.only(top: 18),
          width: ScreenUtil().setWidth(430),
          child: TouchableOpacity(
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(400),
                  child: Text('App Issue', style: textProfile),
                ),
                Container(
                  width: ScreenUtil().setWidth(30),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/union_68.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),)
                )
              ],
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        )
      ],
    )
  );
}

Container RecentActivity(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 24),
    width: ScreenUtil().setWidth(430),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 23),
          child: Text('Need Help With Your Recent Activity?', style: textProfileBold),
        ),
        TouchableOpacity(
          onTap: () => print('Recent Activity'),
          child: Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 17.7, bottom: 8.5),
                  width: ScreenUtil().setWidth(396),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
                  child: Row(
                    children: [
                      Image.asset('assets/recycle_icon.png', width: ScreenUtil().setWidth(34), height: ScreenUtil().setHeight(33),),
                      Container(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text('Collection Successfully', style: textProfileBoldMini),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 11, bottom: 16.7),
                  width: ScreenUtil().setWidth(396),
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(198),
                        child: Text('09:30 | 11 Jul 2021', style: TextStyle(color: Color(0xFF707070), fontFamily: 'DiodrumCyrillic', fontSize: 18.sp),),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(198),
                        alignment: Alignment.centerRight,
                        child: Text('Collection Nr.: 37432', style: TextStyle(color: Color(0xFF707070), fontFamily: 'DiodrumCyrillic', fontSize: 18.sp),),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ],
    )
  );
}

Container MoreHelp(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 31),
    width: ScreenUtil().setWidth(430),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 23),
          child: Text('Find More Help', style: textProfileBold),
        ),
        Container(
          width: ScreenUtil().setWidth(430),
          height: ScreenUtil().setHeight(121),
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/group_2237.png'), fit: BoxFit.fill)),
          child: Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(150),
              ),
              Container(
                width: ScreenUtil().setWidth(280),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 12),
                      width: ScreenUtil().setWidth(280),
                      child: Text('Still Need Help?', style: textProfileBoldWhite),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      width: ScreenUtil().setWidth(280),
                      child: Text('Fastest way to get help', style: textProfileWhite),
                    ),
                    Container(
                      transform: Matrix4.translationValues(-35.0, 0.0, 0.0),
                      padding: const EdgeInsets.only(top: 10),
                      width: ScreenUtil().setWidth(158),
                      child: TouchableOpacity(
                        child: Container(
                          width: ScreenUtil().setWidth(158),
                          height: ScreenUtil().setHeight(36),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text('Chat With Us', style: textProfileBoldColor),
                          ),
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )
  );
}

Container MailUS(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 21, bottom: 50),
    width: ScreenUtil().setWidth(200),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Or you can', style: textProfile),
        TouchableOpacity(
          child: Text(' MAIL US', style: textProfileSemiBoldYellow)
        )
      ]
    ),
  );
}