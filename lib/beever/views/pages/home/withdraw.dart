// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/widgets/home/withdraw_widget.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  WithdrawState createState() => WithdrawState();
}

class WithdrawState extends State<WithdrawScreen> {
  @override
  void initState() {
    super.initState();
  }

  _onWillPop() async {
    Navigator.pop(context, 'back');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
          appBar: AppBar(
              title: const Text('Withdraw', style: textBodyProfile),
              centerTitle: true,
              backgroundColor: const Color(0xFFF8C503),
              leading: TouchableOpacity(
                  onTap: () => Navigator.pop(context, 'back'),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white))),
          body: SingleChildScrollView(
              child: Column(children: [
            const WithdrawWidget(),
            ChooseBankAccount(context)
          ]))),
    );
  }
}
