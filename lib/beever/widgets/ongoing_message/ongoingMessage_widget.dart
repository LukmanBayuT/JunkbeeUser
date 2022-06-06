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
                        width: 390,
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

class InboxList extends StatelessWidget {
  const InboxList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 70),
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
                        width: 390,
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
