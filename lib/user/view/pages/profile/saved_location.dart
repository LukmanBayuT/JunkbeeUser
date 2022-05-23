// ignore_for_file: avoid_print, sized_box_for_whitespace, unused_label, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';
import 'package:junkbee_user/user/view/pages/profile/location.dart';

final SecureStorage secureStorage = SecureStorage();

class SavedLocation extends StatefulWidget {
  const SavedLocation({Key? key}) : super(key: key);

  @override
  SavedLocationState createState() => SavedLocationState();
}

class SavedLocationState extends State<SavedLocation> {
  dynamic token_local;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    setState(() {
      token_local = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8C503),
          title: const Text('Saved Location', style: bodyBodyUserBold),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white)),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width / 1.15,
                child: GestureDetector(
                    onTap: () {
                      if (token_local == null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInUser()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Location()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/group_1663.png',
                                width: MediaQuery.of(context).size.width / 15),
                            Container(
                              padding: const EdgeInsets.only(left: 12),
                              child:
                                  const Text('Add Location', style: bodyBody),
                            )
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            size: 15, color: Color(0xFF707070))
                      ],
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width / 1.15,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xFFDEDEDE)))),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width / 1.15,
                child: const Text('Recent', style: bodyBodySemi),
              ),
              token_local != null
                  ? Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  width:
                                      MediaQuery.of(context).size.width / 1.15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('assets/group_1664.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  15),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text('Gudang Y, PT Amogus',
                                                      style: bodyBodySemi),
                                                  Text(
                                                      'Jl. Kaliwungu 3, Kendari',
                                                      style: bodySlimBody)
                                                ],
                                              ))
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () => print('delete'),
                                        child: Image.asset(
                                            'assets/trash_svgrepo_com.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  width:
                                      MediaQuery.of(context).size.width / 1.15,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFFDEDEDE)))),
                                )
                              ],
                            );
                          }),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
