// ignore_for_file: camel_case_types, sized_box_for_whitespace, unnecessary_const, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:junkbee_user/beever/const/const.dart';

class WithdrawConfirmationWidget extends StatelessWidget {
  const WithdrawConfirmationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/wallet_svgrepo_com.png',
                width: 25,
                height: 25,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Your Available Balance',
                    style: textProfileMini,
                  ))
            ],
          ),
          Container(
              padding: const EdgeInsets.only(top: 15),
              child: const Text(
                'Rp 150.000',
                style: titleBold,
              ))
        ],
      ),
    );
  }
}

class inputAmount extends StatelessWidget {
  const inputAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Enter amount', style: textProfile),
            TouchableOpacity(
                child: Row(children: [
              Image.asset('assets/subtraction_2.png', width: 25, height: 25),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('Enter all amount',
                      style: textProfileMediumGreen))
            ]))
          ])),
      Container(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: '100.000',
                hintStyle: const TextStyle(
                    color: const Color(0xFF707070),
                    fontFamily: 'DiodrumCyrillic'),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1.0),
                    borderRadius: BorderRadius.circular(5))),
          ))
    ]));
  }
}

class sendTo extends StatelessWidget {
  String name;
  String bank_name;
  String no_rek;
  sendTo(
      {Key? key,
      required this.name,
      required this.bank_name,
      required this.no_rek})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Send to', style: textProfile),
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(name, style: textProfileBoldMini),
                          Container(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(bank_name, style: textProfile)),
                          Container(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(no_rek, style: textProfile))
                        ])),
                    TouchableOpacity(
                        onTap: () {
                          showAnimatedDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    elevation: 1,
                                    backgroundColor: Colors.white,
                                    insetPadding: const EdgeInsets.all(0),
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        width: 370,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 25),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(),
                                                      GestureDetector(
                                                          onTap: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(),
                                                          child: Image.asset(
                                                              'assets/group_2210.png',
                                                              width: 20))
                                                    ],
                                                  )),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 18, bottom: 45),
                                                child: const Text(
                                                    'Apakah Anda ingin mengganti item untuk Withdraw?',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF707070),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20)),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child: Container(
                                                          width: 150,
                                                          height: 60,
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                            'Back',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF707070),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 20),
                                                          ))),
                                                  Container(
                                                    width: 150,
                                                    height: 60,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            primary: const Color(
                                                                0xFFF8C503)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          var duration =
                                                              const Duration(
                                                                  milliseconds:
                                                                      500);
                                                          Timer(
                                                              duration,
                                                              () =>
                                                                  Navigator.pop(
                                                                      context));
                                                        },
                                                        child: const Text(
                                                          'Confirm',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 20),
                                                        )),
                                                  )
                                                ],
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 30))
                                            ])));
                              },
                              animationType:
                                  DialogTransitionType.slideFromBottomFade,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(seconds: 1));
                        },
                        child:
                            const Icon(Icons.cancel, color: Color(0xFF707070)))
                  ]))
        ]));
  }
}

Container buttonWithdraw(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
    child: TouchableOpacity(
        child: Container(
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xFFF8C503),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 0.0,
                      offset: Offset(0, 1))
                ]),
            child: const Text('Withdraw', style: textBodyProfile))),
  );
}
