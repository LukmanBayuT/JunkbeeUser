// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/home/withdraw_confirmation_widget.dart';

class WithdrawConfirmation extends StatefulWidget {
  String name;
  String bank_name;
  String no_rek;
  WithdrawConfirmation(
      {Key? key,
      required this.name,
      required this.bank_name,
      required this.no_rek})
      : super(key: key);

  @override
  WithdrawConfirmationState createState() => WithdrawConfirmationState();
}

class WithdrawConfirmationState extends State<WithdrawConfirmation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Withdraw',
              style: textBodyProfile,
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFF8C503),
            leading: TouchableOpacity(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white))),
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: [
          const WithdrawConfirmationWidget(),
          const inputAmount(),
          sendTo(
              name: widget.name,
              bank_name: widget.bank_name,
              no_rek: widget.no_rek),
          buttonWithdraw(context)
        ]))));
  }
}
