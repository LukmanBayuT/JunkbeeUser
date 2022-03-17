// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_renaming_method_parameters, unnecessary_const, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/wallet_svgrepo_com.png', width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text('Your Total Balance', style: textProfileMini,)
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Text('Rp 150.000', style: titleBold,)
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Available for Withdraw', style: textProfileMini),
                Text(' Rp 100.000', style: textProfileMiniGreen)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container ChooseBankAccount(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 20),
    width: ScreenUtil().setWidth(400),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Choose your bank account', style: textProfile,),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: TouchableOpacity(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddBankAccount())),
            child: Row(
              children: [
                Image.asset('assets/subtraction_2.png', width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('Add Bank Account', style: textProfileMediumGreen,),
                )
              ],
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          width: ScreenUtil().setWidth(400),
          decoration: const BoxDecoration(border: const Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),

        const ListBankAccount()
      ]
    ),
  );
}

class ListBankAccount extends StatelessWidget {
  const ListBankAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          width: ScreenUtil().setWidth(400),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: const Color(0xFFDEDEDE)))),
          child: TouchableOpacity(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text('Joko Widodo Sudirjo', style: textProfileBoldMini,),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 2),
                        child: const Text('BCA', style: textProfile,),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 3),
                        child: const Text('00973538296', style: textProfile,),
                      )
                    ],
                  ),
                ),
                const Text('data')
              ],
            ),
          )
        );
      }
    );
  }
}

Container ChooseVirtualAccount(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 20),
    width: ScreenUtil().setWidth(400),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Or choose virtual account', style: textProfile,),
        Container(
          padding: const EdgeInsets.only(top: 25, bottom: 15),
          width: ScreenUtil().setWidth(400),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: const Color(0xFFDEDEDE)))),
          child: TouchableOpacity(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset('assets/logo_ovo_pay.png', width: ScreenUtil().setWidth(80))
                ),
                const Text('data')
              ],
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          width: ScreenUtil().setWidth(400),
          child: TouchableOpacity(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset('assets/rectangle_1869.png', width: ScreenUtil().setWidth(80))
                ),
                const Text('data')
              ],
            ),
          )
        )
      ],
    ),
  );
}

Container ButtonContinue(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 50, bottom: 30),
    child: TouchableOpacity(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WithdrawConfirmation())),
      child: Container(
        width: ScreenUtil().setWidth(400),
        height: ScreenUtil().setHeight(75),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF8C503),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
        ),
        child: const Text('Continue', style: textBodyProfile,),
      )
    ),
  );
}