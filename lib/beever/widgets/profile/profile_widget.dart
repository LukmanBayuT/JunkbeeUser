// ignore_for_file: unused_import, unnecessary_const, sized_box_for_whitespace, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
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
      child: const Center(
          child: const Text(
        'My Account',
        style: textBodyProfile,
      )));
}

SizedBox infoAccount(BuildContext context) {
  void logOut() async {
    final SecureStorage secureStorage = SecureStorage();
    await secureStorage.deleteAllSecureData();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInDriver()));
  }

  return SizedBox(
    child: Container(
        width: ScreenUtil().setWidth(380),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 30),
                child: TouchableOpacity(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SavedLocation())),
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Saved Location',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
                padding: const EdgeInsets.only(top: 15),
                child: TouchableOpacity(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HelpCentre(),
                  )),
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Help Centre',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
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
            //           child: const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xFF707070),)
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ShareFeedback())),
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Share Feedback',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: const Color(0xFFDEDEDE)))),
            ),

            Container(
                padding: const EdgeInsets.only(top: 15),
                child: TouchableOpacity(
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Privacy Policy',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: const Color(0xFFDEDEDE)))),
            ),

            Container(
                padding: const EdgeInsets.only(top: 15),
                child: TouchableOpacity(
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Terms of Service',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: const Color(0xFFDEDEDE)))),
            ),

            Container(
                padding: const EdgeInsets.only(top: 15),
                child: TouchableOpacity(
                  onTap: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 1,
                          backgroundColor: Colors.white,
                          insetPadding: const EdgeInsets.all(0),
                          child: Container(
                            width: ScreenUtil().setWidth(400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 38),
                                  child: Image.asset('assets/group_1718.png', width: ScreenUtil().setWidth(300))
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 14, bottom: 19),
                                  child: Text('Do you enjoy using JunkBee?', style: TextStyle(color: const Color(0xFF707070), fontWeight: FontWeight.w800, fontSize: 20.sp)),
                                ),

                                Container(
                                  width: ScreenUtil().setWidth(300),
                                  height: ScreenUtil().setHeight(60),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: const Color(0xFFF8C503)),
                                    onPressed: () {
                                      Navigator.of(context).pop();

                                      showAnimatedDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                            elevation: 1,
                                            backgroundColor: Colors.white,
                                            insetPadding: const EdgeInsets.all(0),
                                            child: Container(
                                              width: ScreenUtil().setWidth(400),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(top: 38),
                                                    child: Image.asset('assets/group_1734.png', width: ScreenUtil().setWidth(300))
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                                                    child: Text('Amazing!', style: TextStyle(color: const Color(0xFFF8C503), fontWeight: FontWeight.w800, fontSize: 22.sp)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(bottom: 19),
                                                    width: ScreenUtil().setWidth(350),
                                                    child: Text(
                                                      'We are happy to hear that you love using JunkBee App! Would you like to share your experience by rating us on the App Store?',
                                                      style: TextStyle(color: const Color(0xFF707070), fontWeight: FontWeight.w500, fontSize: 18.sp), textAlign: TextAlign.center
                                                    ),
                                                  ),

                                                  Container(
                                                    width: ScreenUtil().setWidth(300),
                                                    height: ScreenUtil().setHeight(60),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: const Color(0xFFF8C503)),
                                                      onPressed: () => Navigator.of(context).pop(),
                                                      child: Text('Give Rating', style: TextStyle( color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20.sp ),)
                                                    ),
                                                  ),
                                                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                                                  GestureDetector(
                                                    onTap: () => Navigator.of(context).pop(),
                                                    child: Container(
                                                      width: ScreenUtil().setWidth(300),
                                                      height: ScreenUtil().setHeight(60),
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFFF1F1F1),
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Text('No, Thanks', style: TextStyle( color: const Color(0xFF707070), fontWeight: FontWeight.w600, fontSize: 20.sp ),)
                                                    )
                                                  ),
                                                  const Padding(padding: EdgeInsets.only(bottom: 30))
                                                ],
                                              )
                                            )
                                          );
                                        },
                                        animationType: DialogTransitionType.slideFromTopFade,
                                        curve: Curves.fastOutSlowIn,
                                        duration: const Duration(seconds: 1)
                                      );
                                    },
                                    child: Text('Yup, Love It!', style: TextStyle( color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20.sp ),)
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 15)),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(60),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('Not Really', style: TextStyle( color: const Color(0xFF707070), fontWeight: FontWeight.w600, fontSize: 20.sp ),)
                                  )
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 30))
                              ],
                            )
                          )
                        );
                      },
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 1)
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Rate Us',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: const Color(0xFFDEDEDE)))),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(300),
                    child: const Text(
                      'About App',
                      style: textProfile,
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(80),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'v 1.0',
                      style: textProfile,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: ScreenUtil().setWidth(380),
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
            ),

            Container(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: TouchableOpacity(
                  onTap: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 1,
                          backgroundColor: Colors.white,
                          insetPadding: const EdgeInsets.all(0),
                          child: Container(
                            width: ScreenUtil().setWidth(420),
                            height: ScreenUtil().setHeight(300),
                            alignment: Alignment.center,
                            child: Container(
                              width: ScreenUtil().setWidth(380),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        GestureDetector(
                                          onTap: () => Navigator.of(context).pop(),
                                          child: Image.asset('assets/group_2210.png', width: ScreenUtil().setWidth(20))
                                        )
                                      ],
                                    )
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 18, bottom: 15),
                                    child: Text('Comeback Soon!', style: TextStyle(color: const Color(0xFF707070), fontWeight: FontWeight.w800, fontSize: 22.sp)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 45),
                                    child: Text(
                                      'Are you sure you want to log out?',
                                      style: TextStyle(color: const Color(0xFF707070), fontWeight: FontWeight.w500, fontSize: 20.sp)
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.of(context).pop(),
                                        child: Container(
                                          width: ScreenUtil().setWidth(190),
                                          height: ScreenUtil().setHeight(60),
                                          alignment: Alignment.center,
                                          child: Text('Back', style: TextStyle( color: const Color(0xFF707070), fontWeight: FontWeight.w600, fontSize: 20.sp ),)
                                        )
                                      ),
                                      Container(
                                        width: ScreenUtil().setWidth(190),
                                        height: ScreenUtil().setHeight(60),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: const Color(0xFFF8C503)),
                                          onPressed: () => logOut(),
                                          child: Text('Confirm', style: TextStyle( color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20.sp ),)
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.only(bottom: 30))
                                ],
                              )
                            )
                          )
                        );
                      },
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 1)
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: const Text(
                          'Log Out',
                          style: textProfile,
                        ),
                      ),
                      Container(
                          width: ScreenUtil().setWidth(80),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.logout_outlined,
                            size: 20,
                            color: Color(0xFF707070),
                          ))
                    ],
                  ),
                )),
          ],
        )),
  );
}
