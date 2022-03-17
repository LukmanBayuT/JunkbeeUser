import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/views/pages/profile/editProfile.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/beever/views/pages/profile/saved_location.dart';
import 'package:junkbee_user/beever/views/pages/profile/help_centre.dart';
import 'package:junkbee_user/beever/views/pages/profile/shareFeedback.dart';
import 'package:junkbee_user/beever/views/signin/sign_in.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 45,
    );
  }
}

SizedBox text(BuildContext context) {
  return SizedBox(
    width: ScreenUtil().setWidth(480),
    child: Center(
      child: Text('My Account', style: textBodyProfile,)
    )
  );
}

SizedBox infoAccount(BuildContext context) {
  void logOut() async {
    final SecureStorage secureStorage = SecureStorage();
    await secureStorage.deleteSecureData('token');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInDriver(),));
  }

  return SizedBox(
    child: Container(
        width: ScreenUtil().setWidth(380),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: TouchableOpacity(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SavedLocation())),
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(300),
                      child: Text('Saved Location', style: textProfile,),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            // Container(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: TouchableOpacity(
            //     child: Row(
            //       children: [
            //         Container(
            //           width: ScreenUtil().setWidth(300),
            //           child: Text('Invite Friends', style: textProfile,),
            //         ),
            //         Container(
            //           width: ScreenUtil().setWidth(80),
            //           alignment: Alignment.centerRight,
            //           child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
            //         )
            //       ],
            //     ),
            //   )
            // ),
            // Container(
            //   padding: const EdgeInsets.only(top: 15),
            //   width: ScreenUtil().setWidth(380),
            //   decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            // ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: TouchableOpacity(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpCentre(),)),
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(300),
                      child: Text('Help Centre', style: textProfile,),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            // Container(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: TouchableOpacity(
            //     child: Row(
            //       children: [
            //         Container(
            //           width: ScreenUtil().setWidth(300),
            //           child: Text('Setting', style: textProfile,),
            //         ),
            //         Container(
            //           width: ScreenUtil().setWidth(80),
            //           alignment: Alignment.centerRight,
            //           child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
            //         )
            //       ],
            //     ),
            //   )
            // ),
            // Container(
            //   padding: const EdgeInsets.only(top: 15),
            //   width: ScreenUtil().setWidth(380),
            //   decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            // ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: TouchableOpacity(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShareFeedback())),
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(300),
                      child: Text('Share Feedback', style: textProfile,),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: TouchableOpacity(
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(300),
                      child: Text('Privacy Policy', style: textProfile,),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: TouchableOpacity(
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(300),
                      child: Text('Terms of Service', style: textProfile,),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: TouchableOpacity(
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(300),
                      child: Text('Rate Us', style: textProfile,),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/arrow_forward.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(300),
                    child: Text('About App', style: textProfile,),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(80),
                    alignment: Alignment.centerRight,
                    child: Text('v 1.0', style: textProfile,),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 25),
              child: TouchableOpacity(
                onTap: () => logOut(),
                child: Container(
                  width: ScreenUtil().setWidth(380),
                  child: Text('Log Out', style: textProfile,),
                ),
              )
            )
          ],
        )
    ),
  );
}