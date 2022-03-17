import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/widgets/profile/profile_widget.dart';
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
                child: Text('Your Total Balance', style: textProfileMini,)
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Rp 150.000', style: titleBold,)
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
        Text('Choose your bank account', style: textProfile,),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: TouchableOpacity(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddBankAccount())),
            child: Row(
              children: [
                Image.asset('assets/subtraction_2.png', width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Add Bank Account', style: textProfileMediumGreen,),
                )
              ],
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          width: ScreenUtil().setWidth(400),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
        ),

        ListBankAccount()
      ]
    ),
  );
}

class ListBankAccount extends StatelessWidget {
  const ListBankAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          width: ScreenUtil().setWidth(400),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
          child: TouchableOpacity(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('Joko Widodo Sudirjo', style: textProfileBoldMini,),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text('BCA', style: textProfile,),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text('00973538296', style: textProfile,),
                      )
                    ],
                  ),
                ),
                Text('data')
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
        Text('Or choose virtual account', style: textProfile,),
        Container(
          padding: const EdgeInsets.only(top: 25, bottom: 15),
          width: ScreenUtil().setWidth(400),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFDEDEDE)))),
          child: TouchableOpacity(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset('assets/logo_ovo_pay.png', width: ScreenUtil().setWidth(80))
                ),
                Text('data')
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
                Text('data')
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
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WithdrawConfirmation())),
      child: Container(
        width: ScreenUtil().setWidth(400),
        height: ScreenUtil().setHeight(75),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF8C503),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
        ),
        child: Text('Continue', style: textBodyProfile,),
      )
    ),
  );
}