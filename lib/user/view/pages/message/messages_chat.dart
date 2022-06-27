// ignore_for_file: unnecessary_const, sized_box_for_whitespace, avoid_init_to_null, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';

final SecureStorage secureStorage = SecureStorage();

class UserMessages extends StatefulWidget {
  const UserMessages({Key? key}) : super(key: key);

  @override
  UserMessagesState createState() => UserMessagesState();
}

class UserMessagesState extends State<UserMessages> {
  dynamic token_local = null;
  int index = 0;

  @override
  void initState() {
    super.initState();
    check_token();
  }

  check_token() async {
    var token = await secureStorage.readSecureData('token');
    setState(() {
      token_local = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
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
              image: const DecorationImage(
                  image: AssetImage('assets/heading.png'), fit: BoxFit.cover)),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 22),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Messages',
                    style: bodyBodyUser,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 15,
                          child: GestureDetector(
                            onTap: () => setState(() => index = 0),
                            child: (index == 0)
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: const LinearGradient(colors: [
                                          const Color(0xFFF8C503),
                                          const Color(0xFFFFE067)
                                        ]),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                              offset: Offset(0, 1))
                                        ]),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Chat',
                                      style: onboardingSkipWhite,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.transparent),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Chat',
                                      style: onboardingSkipWhite,
                                    ),
                                  ),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 15,
                          child: GestureDetector(
                            onTap: () => setState(() => index = 1),
                            child: (index == 1)
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: const LinearGradient(colors: [
                                          const Color(0xFFF8C503),
                                          const Color(0xFFFFE067)
                                        ]),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                              offset: Offset(0, 1))
                                        ]),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Inbox',
                                      style: onboardingSkipWhite,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.transparent),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Inbox',
                                      style: onboardingSkipWhite,
                                    ),
                                  ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (token_local == null) ...[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async {
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInUser()));
                  if (result == 'back') {
                    await check_token();
                    if (mounted) {
                      setState(() {});
                    }
                  }
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFF8C503), Color(0xFFFFE067)])),
                    alignment: Alignment.center,
                    child: const Text('Login / Register',
                        style: bodyBodyUserMini)),
              ))
        ] else ...[
          if (index == 0) ...[
            Container(
              transform: Matrix4.translationValues(0, -25, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                      spreadRadius: 0,
                                      offset: Offset(0, 1))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/beever_image.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                        ),
                                        Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 2, bottom: 10),
                                                    child: const Text(
                                                      'Coming soon',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Color(
                                                              0xFF707070)),
                                                    )),
                                                const Text(
                                                    'This feature coming soon',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF707070)),
                                                    maxLines: 1)
                                              ],
                                            )),
                                        Container(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.6,
                                            alignment: Alignment.topRight,
                                            child: const Text(
                                              'ongoing',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF707070)),
                                            ))
                                      ],
                                    ))
                              ],
                            )),
                        const Padding(padding: EdgeInsets.only(top: 20))
                      ],
                    );
                  }),
            )
          ] else if (index == 1) ...[
            Container(
              transform: Matrix4.translationValues(0, -25, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                      spreadRadius: 0,
                                      offset: Offset(0, 1))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/beever_image.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                        ),
                                        Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 2, bottom: 10),
                                                    child: const Text(
                                                      'This feature will be coming soon!',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Color(
                                                              0xFF707070)),
                                                    )),
                                                const Text(
                                                    'Please Kindly Wait!',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF707070)),
                                                    maxLines: 1)
                                              ],
                                            )),
                                        Container(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.6,
                                            alignment: Alignment.topRight,
                                            child: const Text(
                                              'coming soon',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF707070)),
                                            ))
                                      ],
                                    ))
                              ],
                            )),
                        const Padding(padding: EdgeInsets.only(top: 20))
                      ],
                    );
                  }),
            )
          ]
        ]
      ]),
    ));
  }
}
