// ignore_for_file: sized_box_for_whitespace, unnecessary_const, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TouchableOpacity(
                onTap: () => Navigator.pop(context, true),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white)),
            Container(
                width: 300,
                alignment: Alignment.center,
                child: const Text('History Pick Up', style: textBodyProfile)),
            Container(width: 25)
          ]))
    ]);
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(children: [
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
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 17, left: 10, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  Container(
                                      width: 28,
                                      child:
                                          Image.asset('assets/group_2262.png')),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: const Text('Order From Cynthia',
                                          style: TextStyle(
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16)))
                                ]),
                                const Text('1 hour ago',
                                    style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w500))
                              ])),
                      Container(
                        padding: const EdgeInsets.only(top: 10.5),
                        decoration: const BoxDecoration(
                            border: const Border(
                                bottom: const BorderSide(
                                    width: 1.0, color: Color(0xFFDEDEDE)))),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 17, left: 10, right: 10),
                          child: Row(children: [
                            Image.asset('assets/group_971.png',
                                width: 30, height: 30),
                            Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Pick Up Location',
                                          style: TextStyle(
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 1),
                                          child: Text(
                                              'Tugumuda, 50171 Semarang',
                                              style: TextStyle(
                                                  color: Color(0xFF707070),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15)))
                                    ]))
                          ])),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 17, left: 10, right: 10, bottom: 29),
                          child: Row(children: [
                            Image.asset('assets/group_2267.png', width: 30),
                            const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: const Text('Paper     0.5 kg',
                                    style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)))
                          ]))
                    ]))),
            Container(height: 15)
          ]);
        });
  }
}
