// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  RecentActivityState createState() => RecentActivityState();
}

class RecentActivityState extends State<RecentActivity> {
  List<String> what_happen = [
    'Something wrong with this order',
    'About fee transaction',
    'Others.'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8C503),
          title: const Text('What Happening?', style: textBodyProfile),
          centerTitle: true,
          leading: TouchableOpacity(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white)),
        ),
        body: SingleChildScrollView(
            child: Container(
                width: 480,
                alignment: Alignment.topCenter,
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: what_happen.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: 480,
                                alignment: Alignment.topCenter,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  width: 400,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          what_happen[index],
                                          style: textProfile,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider())),
                  Container(
                      width: 400,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFFDEDEDE)),
                          borderRadius: BorderRadius.circular(16.7)),
                      child: SizedBox(
                        width: 380,
                        child: TextFormField(
                          style: const TextStyle(
                              color: Color(0xFF707070),
                              fontFamily: 'DiodrumCyrillic',
                              fontSize: 18),
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  color: Color(0xFF707070),
                                  fontFamily: 'DiodrumCyrillic',
                                  fontSize: 18),
                              hintText: 'Describe your reason',
                              border: InputBorder.none),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 100),
                      child: TouchableOpacity(
                          child: Container(
                              width: 222,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF8C503),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        spreadRadius: 0.0,
                                        offset: Offset(0, 1))
                                  ]),
                              alignment: Alignment.center,
                              child: const Text('Submit',
                                  style: textBodyProfile))))
                ]))));
  }
}
