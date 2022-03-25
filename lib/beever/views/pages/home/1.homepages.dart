// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/beever/widgets/home/homepages_widget.dart';

class HomePagesDriver extends StatefulWidget {
  const HomePagesDriver({Key? key}) : super(key: key);

  @override
  State<HomePagesDriver> createState() => _HomePagesDriverState();
}

class _HomePagesDriverState extends State<HomePagesDriver> {
  final SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    ApiCallsGetData().getData();
    super.initState();
    getRole();
  }

  getRole() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final userData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> bodyJSON = jsonDecode(userData.body);
    var role = bodyJSON['data']['role'];
    await secureStorage.writeSecureData('role', role);
  }

  userPage() async {
    await secureStorage.deleteAllSecureData();
    Get.offAll(() => const NavigatorUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/heading_full.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60),
              width: MediaQuery.of(context).size.width / 1.1,
            ),
            WhiteSpace(),
            profileAndBalance(context),
            orderPickup(context),
            NewsAPI()
          ],
        ),
      ),
    ));
  }
}
