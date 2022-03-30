// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
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
    patchBeeverLocation();
  }

  getRole() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final userData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> bodyJSON = jsonDecode(userData.body);
    var role = bodyJSON['data']['role'];
    var id = bodyJSON['data']['id'];
    await secureStorage.writeSecureData('role', role);
    await secureStorage.writeSecureData('id', id.toString());
  }

  userPage() async {
    await secureStorage.deleteAllSecureData();
    Get.offAll(() => const NavigatorUser());
  }

  Future<void> patchBeeverLocation() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var id = await secureStorage.readSecureData('id');

    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    print(lat);
    print(long);

    var uri = Uri.https(
        'www.staging2.junkbee.id',
        '/api/beever/update/location',
        {'id': id, 'lat': lat.toString(), 'lng': long.toString()});
    var response =
        await http.patch(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      print(id);
      print(response.body);

      return Future.delayed(Duration(seconds: 5))
          .then((value) => patchBeeverLocation());
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height / 4,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/heading.png'),
                        fit: BoxFit.fill)),
                child: WhiteSpace()),
            profileAndBalance(context),
            orderPickup(context),
            NewsAPI()
          ],
        ),
      ),
    );
  }
}
