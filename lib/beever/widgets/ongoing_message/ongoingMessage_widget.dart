// ignore_for_file: file_names, unused_import, unnecessary_const, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class OngoingMessageWidget extends StatelessWidget {
  const OngoingMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Text(
        'Collection Status',
        style: textBodyProfile,
      ),
    );
  }
}

class ActiveList extends StatelessWidget {
  const ActiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 70),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
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
                        padding:
                            const EdgeInsets.only(top: 17, left: 15, right: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              child: Image.asset('assets/group_2262.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 250,
                              child: const Text('Order From Cynthia',
                                  style: TextStyle(
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16)),
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
                            border: const Border(
                                bottom: const BorderSide(
                                    width: 1.0, color: Color(0xFFDEDEDE)))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 17),
                        width: 390,
                        child: Row(
                          children: [
                            Container(
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
                                    Container(
                                      width: 350,
                                      child: const Text(
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
                            Container(
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
                                    Container(
                                      width: 350,
                                      child: const Text(
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
              ),
              Container(
                height: 15,
              )
            ],
          );
        });
  }
}

class InboxList extends StatelessWidget {
  const InboxList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 70),
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
                          Container(
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
                          border: const Border(
                              bottom: const BorderSide(
                                  width: 1.0, color: Color(0xFFDEDEDE)))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      width: 390,
                      child: Row(
                        children: [
                          Container(
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
                                  Container(
                                    width: 350,
                                    child: const Text(
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
                          Container(
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
                                  Container(
                                    width: 350,
                                    child: const Text(
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
