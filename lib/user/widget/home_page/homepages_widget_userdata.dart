// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_widget_article.dart';

final format = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

class UserDataHomepages extends StatefulWidget {
  final dynamic token_local = null;
  const UserDataHomepages({Key? key}) : super(key: key);

  @override
  State<UserDataHomepages> createState() => _UserDataHomepagesState();
}

class _UserDataHomepagesState extends State<UserDataHomepages> {
  @override
  void initState() {
    super.initState();
  }

  showDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
              title: const Text('Anda bukan beever'),
              content: const Text(
                  'Silahkan mendaftar menjadi beever dengan datang ke kantor pusat Junkbee Semarang'),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('OK',
                        style: bodySlimBody.copyWith(color: Colors.white)))
              ]);
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    String? roles;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 30,
            color: Colors.amberAccent,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background_home_page.png'),
                      fit: BoxFit.cover)),
              child: Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: Column(children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () async {
                              roles =
                                  await secureStorage.readSecureData('roles');
                              print(roles);
                              (roles == 'beever')
                                  ? Get.offAll(() => const NavigatorPages())
                                  : showDialogue();
                            },
                            child: Text('Be a Beever',
                                style: bodyBoldBody.copyWith(
                                    color: Colors.white)))),
                    Container(
                        padding: const EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width,
                        child: FutureBuilder(
                            future: ApiCallsGetData().getUserData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var userdata = snapshot.data;
                                secureStorage.writeSecureData(
                                    'roles', userdata?.data.role);

                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Hi,', style: bodyBodyUser),
                                      Text(
                                          '${userdata?.data.fullName} as ${userdata?.data.role}',
                                          style: bodyBodyUser),
                                      const SizedBox(width: 30),
                                      Row(children: [
                                        Image.asset('assets/dompet.png',
                                            height: 20),
                                        const SizedBox(width: 10),
                                        Text(
                                            '${format.format(int.parse(userdata?.data.balance))}',
                                            style: bodyBodyUser)
                                      ])
                                    ]);
                              } else {
                                return const Center(
                                    child: SpinKitWave(
                                        size: 50, color: mainColor0));
                              }
                            }))
                  ]))),
          const ArticleJunkbee()
        ]));
  }
}

class UIHomePage extends StatelessWidget {
  final String? device_info;
  const UIHomePage({Key? key, required this.device_info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 30,
            color: Colors.amberAccent,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background_home_page.png'),
                      fit: BoxFit.cover)),
              child: Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: Column(children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () => Fluttertoast.showToast(
                                backgroundColor: const Color(0xFFF8C503),
                                msg: 'Anda harus login terlebih dahulu',
                                toastLength: Toast.LENGTH_LONG),
                            child: Text('Be a Beever',
                                style: bodyBoldBody.copyWith(
                                    color: Colors.white)))),
                    Container(
                        padding: const EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Hi,', style: bodyBodyUser),
                              Container(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 9),
                                  child: Text('$device_info',
                                      style: bodyBodyUser)),
                              const SizedBox(width: 30),
                              Row(children: [
                                Image.asset('assets/dompet.png',
                                    height: MediaQuery.of(context).size.height /
                                        25),
                                const SizedBox(width: 10),
                                Text('${format.format(int.parse('0'))}',
                                    style: bodyBodyUser)
                              ])
                            ]))
                  ]))),
          const ArticleJunkbee()
        ]));
  }
}
