import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/home/withdraw_confirmation_widget.dart';

class WithdrawConfirmation extends StatefulWidget {
  const WithdrawConfirmation({Key? key}) : super(key: key);

  _WithdrawConfirmationState createState() => _WithdrawConfirmationState();
}

class _WithdrawConfirmationState extends State<WithdrawConfirmation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 904),
        builder: () => Scaffold(
              appBar: AppBar(
                  title: const Text(
                    'Withdraw',
                    style: textBodyProfile,
                  ),
                  centerTitle: true,
                  backgroundColor: const Color(0xFFF8C503),
                  leading: TouchableOpacity(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  )),
              body: SingleChildScrollView(
                  child: Container(
                width: ScreenUtil().setWidth(480),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const WithdrawConfirmationWidget(),
                    const inputAmount(),
                    const sendTo(),
                    buttonWithdraw(context)
                  ],
                ),
              )),
            ));
  }
}
