// ignore_for_file: unused_import, unnecessary_const, sized_box_for_whitespace, unused_element, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
import 'package:junkbee_user/user/view/splashscreen/1. onboarding_splash_screen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 50);
  }
}

SizedBox text(BuildContext context) {
  return const SizedBox(
      child: Center(child: Text('My Account', style: textBodyProfile)));
}

SizedBox infoAccount(BuildContext context) {
  final SecureStorage secureStorage = SecureStorage();

  void logOut() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final logOut = await http.post(
        Uri.parse(EndPoint.baseApiURL + EndPoint.logoutURL),
        headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> bodyJson = jsonDecode(logOut.body);
    if (bodyJson['message'] == 'success') {
      await secureStorage.deleteAllSecureData();

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const OnboardingSplashScreen()));
    } else {
      if (kDebugMode) {
        print(bodyJson);
      }
    }
  }

  return SizedBox(
      child: Column(children: [
    Container(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: TouchableOpacity(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SavedLocation())),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Saved Location', style: textProfile),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Color(0xFF707070))
                ]))),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TouchableOpacity(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HelpCentre(),
                )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Help Centre', style: textProfile),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Color(0xFF707070))
                ]))),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    // Container(
    //   padding: const EdgeInsets.only(top: 15),
    //   child: TouchableOpacity(
    //     child: Row(
    //       children: [
    //         Container(
    //           width: 300,
    //           child: Text('Setting', style: textProfile,),
    //         ),
    //         Container(
    //           width: 80,
    //           alignment: Alignment.centerRight,
    //           child: const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xFF707070),)
    //         )
    //       ],
    //     ),
    //   )
    // ),
    // Container(
    //   padding: const EdgeInsets.only(top: 15),
    //   width: 380,
    //   decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
    // ),

    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TouchableOpacity(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ShareFeedback())),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Share Feedback', style: textProfile),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Color(0xFF707070))
                ]))),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TouchableOpacity(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
              Text('Privacy Policy', style: textProfile),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 15, color: Color(0xFF707070))
            ]))),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TouchableOpacity(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
              Text('Terms of Service', style: textProfile),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 15, color: Color(0xFF707070))
            ]))),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TouchableOpacity(
            onTap: () {
              showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 1,
                        backgroundColor: Colors.white,
                        insetPadding: const EdgeInsets.all(0),
                        child: Container(
                            width: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(top: 38),
                                    child: Image.asset('assets/group_1718.png',
                                        width: 300)),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 14, bottom: 19),
                                  child: const Text(
                                      'Do you enjoy using JunkBee?',
                                      style: TextStyle(
                                          color: Color(0xFF707070),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20)),
                                ),
                                Container(
                                  width: 300,
                                  height: 60,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          primary: const Color(0xFFF8C503)),
                                      onPressed: () {
                                        Navigator.of(context).pop();

                                        showAnimatedDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  elevation: 1,
                                                  backgroundColor: Colors.white,
                                                  insetPadding:
                                                      const EdgeInsets.all(0),
                                                  child: Container(
                                                      width: 400,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 38),
                                                              child: Image.asset(
                                                                  'assets/group_1734.png',
                                                                  width: 300)),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20,
                                                                    bottom: 10),
                                                            child: const Text(
                                                                'Amazing!',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFF8C503),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        22)),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 19),
                                                            width: 350,
                                                            child: const Text(
                                                                'We are happy to hear that you love using JunkBee App! Would you like to share your experience by rating us on the App Store?',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF707070),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        18),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                          Container(
                                                            width: 300,
                                                            height: 60,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                10)),
                                                                        primary:
                                                                            const Color(
                                                                                0xFFF8C503)),
                                                                    onPressed: () =>
                                                                        Navigator.of(context)
                                                                            .pop(),
                                                                    child:
                                                                        const Text(
                                                                      'Give Rating',
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .w800,
                                                                          fontSize:
                                                                              20),
                                                                    )),
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          15)),
                                                          GestureDetector(
                                                              onTap: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(),
                                                              child: Container(
                                                                  width: 300,
                                                                  height: 60,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFF1F1F1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      const Text(
                                                                    'No, Thanks',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF707070),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            20),
                                                                  ))),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          30))
                                                        ],
                                                      )));
                                            },
                                            animationType: DialogTransitionType
                                                .slideFromTopFade,
                                            curve: Curves.fastOutSlowIn,
                                            duration:
                                                const Duration(seconds: 1));
                                      },
                                      child: const Text(
                                        'Yup, Love It!',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20),
                                      )),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(bottom: 15)),
                                GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                        width: 300,
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFF1F1F1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Text(
                                          'Not Really',
                                          style: TextStyle(
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ))),
                                const Padding(
                                    padding: EdgeInsets.only(bottom: 30))
                              ],
                            )));
                  },
                  animationType: DialogTransitionType.slideFromBottomFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Rate Us', style: textProfile),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Color(0xFF707070))
                ]))),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('About App', style: textProfile),
              Text('v 1.0', style: textProfile)
            ])),
    Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: const Divider(thickness: 1.0)),

    Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 25, left: 10, right: 10),
        child: TouchableOpacity(
            onTap: () {
              showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 1,
                        backgroundColor: Colors.white,
                        insetPadding: const EdgeInsets.all(0),
                        child: Container(
                            width: 420,
                            height: 300,
                            alignment: Alignment.center,
                            child: Container(
                                width: 380,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(),
                                            GestureDetector(
                                                onTap: () =>
                                                    Navigator.of(context).pop(),
                                                child: Image.asset(
                                                    'assets/group_2210.png',
                                                    width: 20))
                                          ],
                                        )),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 18, bottom: 15),
                                      child: const Text('Comeback Soon!',
                                          style: TextStyle(
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w800,
                                              fontSize: 22)),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 45),
                                      child: const Text(
                                          'Are you sure you want to log out?',
                                          style: TextStyle(
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: Container(
                                                width: 190,
                                                height: 60,
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'Back',
                                                  style: TextStyle(
                                                      color: Color(0xFF707070),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20),
                                                ))),
                                        Container(
                                          width: 190,
                                          height: 60,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  primary:
                                                      const Color(0xFFF8C503)),
                                              onPressed: () => logOut(),
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20),
                                              )),
                                        )
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(bottom: 30))
                                  ],
                                ))));
                  },
                  animationType: DialogTransitionType.slideFromBottomFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Log Out', style: textProfile),
                  Icon(Icons.logout_outlined,
                      size: 20, color: Color(0xFF707070))
                ])))
  ]));
}
