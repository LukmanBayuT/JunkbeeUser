// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/widgets/home/withdraw_widget.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<WithdrawScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext) {
    return ScreenUtilInit(
        designSize: const Size(480, 904),
        builder: () => Scaffold(
              appBar: AppBar(
                  title: const Text('Withdraw', style: textBodyProfile),
                  centerTitle: true,
                  backgroundColor: const Color(0xFFF8C503),
                  leading: TouchableOpacity(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new_rounded))),
              body: SingleChildScrollView(
                child: Container(
                  width: ScreenUtil().setWidth(480),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const WithdrawWidget(),
                      ChooseBankAccount(context),
                      ChooseVirtualAccount(context),
                      ButtonContinue(context)
                    ],
                  ),
                ),
              ),
            ));
  }
}
