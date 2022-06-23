// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/widget/profile/helpCentre_widget.dart';

class HelpCentre extends StatefulWidget {
  const HelpCentre({Key? key}) : super(key: key);

  @override
  HelpCentreState createState() => HelpCentreState();
}

class HelpCentreState extends State<HelpCentre> {
  @override
  void initState() {
    super.initState();
    ApiCallsGetDataUser().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(220),
            child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/group_2239.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Row(children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 5,
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 22,
                                    color: Colors.white))),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            alignment: Alignment.topCenter,
                            child: const Text('Help Centre',
                                style: bodyBodyUserBold)),
                        Container(width: MediaQuery.of(context).size.width / 5)
                      ])),
                  Container(
                      padding: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                alignment: Alignment.topLeft,
                                child: FutureBuilder(
                                    future: ApiCallsGetDataUser().getUserData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      var data = snapshot.data;
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(
                                            'Hi ${data?.data.fullName},',
                                            style: bodyBodyMini);
                                      }
                                      return Container(
                                          width: 150,
                                          child: const SpinKitThreeBounce(
                                              color: Colors.white, size: 20));
                                    })),
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 4),
                                child: const Text('We Are Ready',
                                    style: bodyBodyUserBold)),
                            const Text('To Help You', style: bodyBodyUserBold)
                          ]))
                ]))),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDEDEDE),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 10),
                                child: Image.asset('assets/search_icon.png',
                                    width: MediaQuery.of(context).size.width /
                                        18)),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.32,
                                child: TextFormField(
                                    style: bodyBody,
                                    decoration: const InputDecoration(
                                        hintText: 'Search Help',
                                        hintStyle: bodyBody,
                                        border: InputBorder.none)))
                          ]))),
                  AllTopics(context),
                  const RecentActivity(),
                  FindMoreHelp(context)
                ]))));
  }
}
