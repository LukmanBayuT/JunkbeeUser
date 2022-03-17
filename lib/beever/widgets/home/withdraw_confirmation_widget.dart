import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
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
              Image.asset('assets/wallet_svgrepo_com.png', width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Your Available Balance', style: textProfileMini,)
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Rp 150.000', style: titleBold,)
          )
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
      width: ScreenUtil().setWidth(400),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            width: ScreenUtil().setWidth(400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Enter amount', style: textProfile,),
                TouchableOpacity(
                  child: Row(
                    children: [
                      Image.asset('assets/subtraction_2.png', width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Enter all amount', style: textProfileMediumGreen,),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            width: ScreenUtil().setWidth(400),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '100.000',
                hintStyle: TextStyle(color: Color(0xFF707070), fontFamily: 'DiodrumCyrillic'),
                border: OutlineInputBorder(borderSide: BorderSide(width: 1.0), borderRadius: BorderRadius.circular(5))
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class sendTo extends StatelessWidget {
  const sendTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Send to', style: textProfile,),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Joko Widodo Sudirjo', style: textProfileBoldMini,),
                      Container(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text('BCA', style: textProfile,),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text('00973538296', style: textProfile,),
                      )
                    ],
                  ),
                ),
                TouchableOpacity(
                  onTap: () => print('cancel'),
                  child: Icon(Icons.cancel, color: Color(0xFF707070),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container buttonWithdraw(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 200),
    child: TouchableOpacity(
      child: Container(
        width: ScreenUtil().setWidth(400),
        height: ScreenUtil().setHeight(75),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF8C503),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
        ),
        child: Text('Withdraw', style: textBodyProfile,),
      )
    ),
  );
}