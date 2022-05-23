// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_renaming_method_parameters, unnecessary_const, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/views/pages/home/addBankAccount.dart';
import 'package:junkbee_user/beever/views/pages/home/withdrawConfirmation.dart';

class WithdrawWidget extends StatelessWidget {
  const WithdrawWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return Container(
        padding: const EdgeInsets.only(top: 25),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/wallet_svgrepo_com.png', width: 25, height: 25),
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text('Your Total Balance', style: textProfileMini))
          ]),
          Container(
              padding: const EdgeInsets.only(top: 15),
              child: const Text('Rp 150.000', style: titleBold)),
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Available for Withdraw', style: textProfileMini),
                    Text(' Rp 100.000', style: textProfileMiniGreen)
                  ]))
        ]));
  }
}

Container ChooseBankAccount(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Text(
            'Choose your bank account',
            style: textProfile,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TouchableOpacity(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddBankAccount())),
                child: Row(children: [
                  Image.asset('assets/subtraction_2.png',
                      width: 25, height: 25),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text('Add Bank Account',
                          style: textProfileMediumGreen))
                ]))),
        Container(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: const Divider(thickness: 1.0)),
        const ListBankAccount()
      ]));
}

class ListBankAccount extends StatefulWidget {
  const ListBankAccount({Key? key}) : super(key: key);

  @override
  _ListBankAccountState createState() => _ListBankAccountState();
}

class _ListBankAccountState extends State<ListBankAccount> {
  List BankAccount = [
    {
      'id': 1,
      'bank_name': 'BCA',
      'no_rek': '00973538296',
      'name': 'Joko Widodo Sudirjo'
    },
    {'id': 2, 'bank_name': 'BCA', 'no_rek': '00973538296', 'name': 'Michael'}
  ];
  List VirtualAccount = [
    {
      'id': 1,
      'bank_name': 'OVO',
      'name': 'Joko Widodo Sudirjo',
      'no_rek': '085848670282',
      'image': 'assets/logo_ovo_pay.png'
    },
    {
      'id': 2,
      'bank_name': 'DANA',
      'name': 'Michael',
      'no_rek': '085848670282',
      'image': 'assets/rectangle_1869.png'
    }
  ];
  String name = '';
  String no_rek = '';
  String payment_method = '';
  int? id_payment;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: BankAccount.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: const Color(0xFFDEDEDE)))),
                  child: TouchableOpacity(
                      onTap: () {
                        setState(() {
                          name = BankAccount[index]['name'];
                          no_rek = BankAccount[index]['no_rek'];
                          payment_method = BankAccount[index]['bank_name'];
                          id_payment = BankAccount[index]['id'];
                        });
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Container(
                                      child: Text(BankAccount[index]['name'],
                                          style: textProfileBoldMini)),
                                  Container(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                          BankAccount[index]['bank_name'],
                                          style: textProfile)),
                                  Container(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(BankAccount[index]['no_rek'],
                                          style: textProfile))
                                ])),
                            (id_payment == BankAccount[index]['id'] &&
                                    payment_method ==
                                        BankAccount[index]['bank_name']
                                ? Image.asset('assets/group_2201.png',
                                    width: 20)
                                : Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20))))
                          ]))),
            );
          }),
      Container(
          padding: const EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text('Or choose virtual account',
                    style: textProfile)),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: VirtualAccount.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: const Color(0xFFDEDEDE)))),
                        child: TouchableOpacity(
                            onTap: () {
                              setState(() {
                                name = VirtualAccount[index]['name'];
                                no_rek = VirtualAccount[index]['no_rek'];
                                payment_method =
                                    VirtualAccount[index]['bank_name'];
                                id_payment = VirtualAccount[index]['id'];
                              });
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Image.asset(
                                          VirtualAccount[index]['image'],
                                          width: 80)),
                                  (id_payment == VirtualAccount[index]['id'] &&
                                          payment_method ==
                                              VirtualAccount[index]['bank_name']
                                      ? Image.asset('assets/group_2201.png',
                                          width: 20)
                                      : Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20))))
                                ]))),
                  );
                })
          ])),
      Container(
          padding:
              const EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
          child: TouchableOpacity(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WithdrawConfirmation(
                      name: name, bank_name: payment_method, no_rek: no_rek))),
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
                  child: const Text('Continue', style: textBodyProfile))))
    ]);
  }
}
