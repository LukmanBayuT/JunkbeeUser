// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CurrentWidget extends StatelessWidget {
  const CurrentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 480,
        height: 80,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 430,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TouchableOpacity(
                      onTap: () => Navigator.pop(context, true),
                      child: Image.asset(
                        'assets/group_2211.png',
                        width: 15.2,
                        height: 24.2,
                      ),
                    )),
              ),
              Container(
                width: 350,
                alignment: Alignment.center,
                child: const Text('Current Pick Up', style: textBodyProfile),
              ),
              Container(
                width: 40,
              )
            ],
          ),
        ));
  }
}

class CurrentList extends StatelessWidget {
  const CurrentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 420,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: 390,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Image.asset('assets/group_2262.png'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: 250,
                            child: const Text(
                              'Order From Cynthia',
                              style: textProfileBoldMini,
                            ),
                          ),
                          Container(
                            width: 100,
                            alignment: Alignment.centerRight,
                            child: const Text(
                              '1 hour ago',
                              style: textProfile,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.5),
                      width: 390,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.0, color: Color(0xFFDEDEDE)))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: 390,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Image.asset(
                              'assets/group_971.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 350,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    width: 350,
                                    child: Text(
                                      'Pick Up Location',
                                      style: textProfile,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 1),
                                    width: 350,
                                    child: const Text(
                                      'Tugumuda, 50171 Semarang',
                                      style: textProfileBoldMini,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17, bottom: 29),
                      width: 390,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Image.asset(
                              'assets/group_2267.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 350,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    width: 350,
                                    child: Text(
                                      'Paper     0.5 kg',
                                      style: textProfile,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
              )
            ],
          );
        });
  }
}
