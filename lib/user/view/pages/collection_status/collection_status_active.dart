// ignore_for_file: sized_box_for_whitespace, avoid_init_to_null, non_constant_identifier_names, unnecessary_const, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_collection.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';

final SecureStorage secureStorage = SecureStorage();

class CollectionStatusUser extends StatefulWidget {
  const CollectionStatusUser({Key? key}) : super(key: key);

  @override
  _CollectionStatusUserState createState() => _CollectionStatusUserState();
}

class _CollectionStatusUserState extends State<CollectionStatusUser> {
  int index = 0;
  dynamic token_local = null;
  dynamic data = null;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
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
              image: DecorationImage(
                  image: AssetImage('assets/heading.png'), fit: BoxFit.cover)),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 22),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: const Text('Collection Status', style: bodyBodyUser),
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
                                        // ignore: unnecessary_const
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFFF8C503),
                                          Color(0xFFFFE067)
                                        ]),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                              offset: Offset(0, 1))
                                        ]),
                                    alignment: Alignment.center,
                                    child: const Text('Active',
                                        style: onboardingSkipWhite),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.transparent),
                                    alignment: Alignment.center,
                                    child: const Text('Active',
                                        style: onboardingSkipWhite),
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
                                        // ignore: unnecessary_const
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
                                    child: const Text('History',
                                        style: onboardingSkipWhite),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.transparent),
                                    alignment: Alignment.center,
                                    child: const Text('History',
                                        style: onboardingSkipWhite),
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
                    await checkToken();
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
            FutureBuilder(
              future: GetCollectionData().getCollectionData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var collectiondata = snapshot.data;
                  return collectiondata.data.length == 0
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.5,
                          alignment: Alignment.center,
                          child: const Text(
                              'Tidak ada Collection Status yang aktif',
                              style: bodyBody),
                        )
                      : Container(
                          transform: Matrix4.translationValues(0, -25, 0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.4,
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              itemCount: collectiondata.data.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/logo_beever.png',
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              12),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.4,
                                                      child: const Text(
                                                        'Great! we are looking for a Beever for you',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: Color(
                                                                0xFF707070)),
                                                      ))
                                                ],
                                              )),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.25,
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: Color(
                                                            0xFFDEDEDE)))),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Pesanan dibuat : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFFF8C503)),
                                                  ),
                                                  Text(
                                                      '${collectiondata.data[index].createdAt}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Color(
                                                              0xFFF8C503)))
                                                ],
                                              )),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.25,
                                            child: const Text(
                                              'Pesanan anda akan segera diambil oleh Beever kami, mohon ketersediaannya untuk menunggu',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF707070)),
                                            ),
                                          ),
                                          ExpansionTile(
                                            title: const Text(
                                              'Muat Lebih Banyak',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xFF707070)),
                                            ),
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'ID pesanan : ${collectiondata.data[index].id}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF707070)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Kode order pesanan : ${collectiondata.data[index].orderCode}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF707070)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Pesanan dibuat pada tanggal : ${collectiondata.data[index].createdAt}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF707070)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 15))
                                  ],
                                );
                              }),
                        );
                } else {
                  return const Center(
                      child: SpinKitWave(size: 50, color: Colors.amber));
                }
              },
            ),
          ] else if (index == 1) ...[
            FutureBuilder(
              future: GetCollectionData().getCollectionData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var collectiondata = snapshot.data;
                  return collectiondata.data.length == 0
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.5,
                          alignment: Alignment.center,
                          child:
                              const Text('Tidak ada History', style: bodyBody))
                      : Container(
                          transform: Matrix4.translationValues(0, -25, 0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.4,
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              itemCount: collectiondata.data.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/logo_beever.png',
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              12),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.4,
                                                      child: const Text(
                                                        'Great! we are looking for a Beever for you',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: Color(
                                                                0xFF707070)),
                                                      ))
                                                ],
                                              )),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.25,
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: Color(
                                                            0xFFDEDEDE)))),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Pesanan dibuat : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFFF8C503)),
                                                  ),
                                                  Text(
                                                      '${collectiondata.data[index].createdAt}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Color(
                                                              0xFFF8C503)))
                                                ],
                                              )),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.25,
                                            child: const Text(
                                              'Pesanan anda akan segera diambil oleh Beever kami, mohon ketersediaannya untuk menunggu',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF707070)),
                                            ),
                                          ),
                                          ExpansionTile(
                                            title: const Text(
                                              'Muat Lebih Banyak',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xFF707070)),
                                            ),
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'ID pesanan : ${collectiondata.data[index].id}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF707070)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Kode order pesanan : ${collectiondata.data[index].orderCode}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF707070)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Pesanan dibuat pada tanggal : ${collectiondata.data[index].createdAt}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF707070)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 15))
                                  ],
                                );
                              }),
                        );
                } else {
                  return const Center(
                      child: SpinKitWave(size: 50, color: Colors.amber));
                }
              },
            ),
          ]
        ]
      ]),
    ));
  }
}
