// ignore_for_file: unused_import, unnecessary_const, sized_box_for_whitespace, unused_element

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
                  onTap: () => logOut(),
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
