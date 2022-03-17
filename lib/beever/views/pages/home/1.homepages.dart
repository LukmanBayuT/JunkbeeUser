// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/heading_full.png'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WhiteSpace(),
              profileAndBalance(context),
              orderPickup(context),
              NewsAPI()
            ],
          ),
        ),
      )
    );
  }
}
