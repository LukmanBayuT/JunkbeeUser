// ignore_for_file: avoid_init_to_null, non_constant_identifier_names, unnecessary_const, prefer_const_declarations, unused_import, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'edit_profile.dart';
import 'help_centre.dart';
import 'saved_location.dart';
import 'share_feedback.dart';

final SecureStorage secureStorage = SecureStorage();

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  dynamic token_local = null;

  @override
  void initState() {
    super.initState();

    checkToken();
  }

  checkToken() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    if (mounted) {
      setState(() {
        token_local = token;
      });
    }
    if (token != null) {
      getRole(token);
      await ApiCallsGetData().getUserData();
      if (mounted) {
        setState(() {});
      }
    }
  }

  getRole(token) async {
    final userData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> bodyJSON = jsonDecode(userData.body);
    var role = bodyJSON['data']['role'];
    await secureStorage.writeSecureData('role', role);
  }

  logOut() async {
    await secureStorage.deleteAllSecureData();
    Navigator.pop(context);
    await checkToken();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 30,
                  color: Colors.amberAccent,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4.5,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/heading.png'),
                          fit: BoxFit.cover)),
                  child: Container(
                      padding: const EdgeInsets.only(top: 25),
                      child: const Text(
                        'My Account',
                        style: bodyBodyUser,
                      )),
                ),
                Container(
                  transform: Matrix4.translationValues(0, -85, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Column(
                      children: [
                        Card(
                          shape: roundedRectBor,
                          margin: defaultPadding4,
                          child: Column(
                            children: [
                              if (token_local == null) ...[
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: GestureDetector(
                                      onTap: () async {
                                        var result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInUser()));
                                        if (result == 'back') {
                                          await checkToken();
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  const Color(0xFFF8C503),
                                                  const Color(0xFFFFE067)
                                                ])),
                                        alignment: Alignment.center,
                                        child: const Text('Login / Register',
                                            style: bodyBodyUserMini),
                                      ),
                                    ))
                              ] else ...[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  child: FutureBuilder(
                                    future: ApiCallsGetData().getUserData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        var userdata = snapshot.data;
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: userdata
                                                                  .data.image ==
                                                              null
                                                          ? Image.asset(
                                                              'assets/beever_image.png',
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                            )
                                                          : Image.network(
                                                              '${EndPoint.baseURL}storage/profile-images/${userdata.data.image}',
                                                              width: MediaQuery
                                                                          .of(
                                                                              context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  10,
                                                              fit:
                                                                  BoxFit.cover),
                                                    )),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            '${userdata?.data.fullName}',
                                                            style:
                                                                bodyBoldBody),
                                                        if (userdata
                                                                ?.data.phone ==
                                                            '') ...[
                                                          Text('-',
                                                              style:
                                                                  bodySlimBody)
                                                        ] else ...[
                                                          Text(
                                                              '${userdata?.data.phone}',
                                                              style:
                                                                  bodySlimBody)
                                                        ],
                                                        Text(
                                                            '${userdata?.data.email}',
                                                            style:
                                                                bodySlimBody),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () async {
                                                  if (userdata.data.image ==
                                                      null) {
                                                    final imageURL =
                                                        userdata.data.image;
                                                    final result = await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => EditProfile(
                                                                image: imageURL,
                                                                name: userdata
                                                                    ?.data
                                                                    .fullName,
                                                                phone: userdata
                                                                    ?.data
                                                                    .phone,
                                                                email: userdata
                                                                    ?.data
                                                                    .email)));
                                                    if (result == 'back') {
                                                      await ApiCallsGetData()
                                                          .getUserData();
                                                      setState(() {});
                                                    }
                                                  } else {
                                                    final imageURL = EndPoint
                                                            .baseURL +
                                                        'storage/profile-images/' +
                                                        userdata.data.image;
                                                    final result = await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => EditProfile(
                                                                image: imageURL,
                                                                name: userdata
                                                                    ?.data
                                                                    .fullName,
                                                                phone: userdata
                                                                    ?.data
                                                                    .phone,
                                                                email: userdata
                                                                    ?.data
                                                                    .email)));
                                                    if (result == 'back') {
                                                      await ApiCallsGetData()
                                                          .getUserData();
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                icon: const Icon(
                                                    Icons.edit_rounded,
                                                    color: Colors.amber))
                                          ],
                                        );
                                      } else {
                                        return const Center(
                                            child: SpinKitWave(
                                                size: 50, color: mainColor2));
                                      }
                                    },
                                  ),
                                )
                              ],
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SavedLocation())),
                                    child: const ListTile(
                                      title: Text('Saved Location',
                                          style: bodySlimBody),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HelpCentre())),
                                      child: const ListTile(
                                        title: Text('Help Center',
                                            style: bodySlimBody),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20,
                                        ),
                                      )),
                                  GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ShareFeedback())),
                                      child: const ListTile(
                                        title: Text('Share Feedback',
                                            style: bodySlimBody),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20,
                                        ),
                                      )),
                                  const ListTile(
                                    title: Text('Privacy Policy',
                                        style: bodySlimBody),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 20,
                                    ),
                                  ),
                                  const ListTile(
                                    title: Text('Terms of Services',
                                        style: bodySlimBody),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 20,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.2,
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
                                                                  'assets/group_1718.png',
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      2)),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 14,
                                                                    bottom: 19),
                                                            child: Text(
                                                                'Do you enjoy using JunkBee?',
                                                                style:
                                                                    bodyBodyBold),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                8,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                10)),
                                                                        primary:
                                                                            const Color(
                                                                                0xFFF8C503)),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();

                                                                      showAnimatedDialog(
                                                                          context:
                                                                              context,
                                                                          barrierDismissible:
                                                                              true,
                                                                          builder: (BuildContext
                                                                              context) {
                                                                            return Dialog(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                                                elevation: 1,
                                                                                backgroundColor: Colors.white,
                                                                                insetPadding: const EdgeInsets.all(0),
                                                                                child: Container(
                                                                                    width: MediaQuery.of(context).size.width / 1.2,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(padding: const EdgeInsets.only(top: 38), child: Image.asset('assets/group_1734.png', width: MediaQuery.of(context).size.width / 2)),
                                                                                        Container(
                                                                                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                                                                                          child: const Text('Amazing!', style: titleBodyDialog),
                                                                                        ),
                                                                                        Container(
                                                                                          padding: const EdgeInsets.only(bottom: 19),
                                                                                          width: MediaQuery.of(context).size.width / 1.4,
                                                                                          child: const Text('We are happy to hear that you love using JunkBee App! Would you like to share your experience by rating us on the App Store?', style: bodyBody, textAlign: TextAlign.center),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width / 2,
                                                                                          height: MediaQuery.of(context).size.width / 8,
                                                                                          child: ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: const Color(0xFFF8C503)), onPressed: () => Navigator.of(context).pop(), child: const Text('Give Rating', style: bodyBodyMini)),
                                                                                        ),
                                                                                        const Padding(padding: EdgeInsets.only(bottom: 15)),
                                                                                        GestureDetector(onTap: () => Navigator.of(context).pop(), child: Container(width: MediaQuery.of(context).size.width / 2, height: MediaQuery.of(context).size.width / 8, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFF1F1F1), borderRadius: BorderRadius.circular(10)), child: const Text('No, Thanks', style: bodyBodySemi))),
                                                                                        const Padding(padding: EdgeInsets.only(bottom: 30))
                                                                                      ],
                                                                                    )));
                                                                          },
                                                                          animationType: DialogTransitionType
                                                                              .slideFromTopFade,
                                                                          curve: Curves
                                                                              .fastOutSlowIn,
                                                                          duration:
                                                                              const Duration(seconds: 1));
                                                                    },
                                                                    child: const Text(
                                                                        'Yup, Love It!',
                                                                        style:
                                                                            bodyBodyMini)),
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          15)),
                                                          GestureDetector(
                                                              onTap: () =>
                                                                  Navigator.of(context)
                                                                      .pop(),
                                                              child: Container(
                                                                  width:
                                                                      MediaQuery.of(context).size.width /
                                                                          2,
                                                                  height: MediaQuery.of(context)
                                                                          .size
                                                                          .width /
                                                                      8,
                                                                  alignment: Alignment
                                                                      .center,
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFF1F1F1),
                                                                      borderRadius: BorderRadius.circular(
                                                                          10)),
                                                                  child: const Text(
                                                                      'Not Really',
                                                                      style: bodyBodySemi))),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          30))
                                                        ],
                                                      )));
                                            },
                                            animationType: DialogTransitionType
                                                .slideFromBottomFade,
                                            curve: Curves.fastOutSlowIn,
                                            duration:
                                                const Duration(seconds: 1));
                                      },
                                      child: const ListTile(
                                        title: Text('Rate us',
                                            style: bodySlimBody),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20,
                                        ),
                                      )),
                                  const ListTile(
                                      title: Text('About App',
                                          style: bodySlimBody),
                                      trailing:
                                          Text('v 1.0', style: bodySlimBody)),
                                  if (token_local != null) ...[
                                    GestureDetector(
                                        onTap: () {
                                          showAnimatedDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                    elevation: 1,
                                                    backgroundColor: Colors
                                                        .white,
                                                    insetPadding:
                                                        const EdgeInsets.all(0),
                                                    child: Container(
                                                        width: MediaQuery
                                                                    .of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                        height:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                3.1,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.3,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                    child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(),
                                                                    GestureDetector(
                                                                        onTap: () =>
                                                                            Navigator.of(context)
                                                                                .pop(),
                                                                        child: Image.asset(
                                                                            'assets/group_2210.png',
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 25))
                                                                  ],
                                                                )),
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 18,
                                                                      bottom:
                                                                          15),
                                                                  child: Text(
                                                                      'Comeback Soon!',
                                                                      style:
                                                                          titleBodyLogout),
                                                                ),
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          45),
                                                                  child: Text(
                                                                      'Are you sure you want to log out?',
                                                                      style:
                                                                          bodyBody),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    GestureDetector(
                                                                        onTap: () =>
                                                                            Navigator.of(context)
                                                                                .pop(),
                                                                        child: Container(
                                                                            width: MediaQuery.of(context).size.width /
                                                                                2.8,
                                                                            height: MediaQuery.of(context).size.height /
                                                                                13,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child: Text('Back', style: bodyBodySemi))),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2.8,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          13,
                                                                      child: ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: const Color(0xFFF8C503)),
                                                                          onPressed: () {
                                                                            logOut();
                                                                          },
                                                                          child: Text('Confirm', style: bodyBodyMini)),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ))));
                                              },
                                              animationType:
                                                  DialogTransitionType
                                                      .slideFromBottomFade,
                                              curve: Curves.fastOutSlowIn,
                                              duration:
                                                  const Duration(seconds: 1));
                                        },
                                        child: const ListTile(
                                          title: Text('Log Out',
                                              style: bodySlimBody),
                                          trailing: Icon(
                                            Icons.logout_outlined,
                                            size: 20,
                                          ),
                                        ))
                                  ]
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
