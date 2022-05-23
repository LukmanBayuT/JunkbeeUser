// ignore_for_file: camel_case_types, sized_box_for_whitespace, unnecessary_const, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enter amount',
                  style: textProfile,
                ),
                TouchableOpacity(
                    child: Row(
                  children: [
                    Image.asset(
                      'assets/subtraction_2.png',
                      width: 25,
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Enter all amount',
                        style: textProfileMediumGreen,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
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
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send to',
            style: textProfile,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Joko Widodo Sudirjo',
                        style: textProfileBoldMini,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 3),
                        child: const Text(
                          'BCA',
                          style: textProfile,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 1),
                        child: const Text(
                          '00973538296',
                          style: textProfile,
                        ),
                      )
                    ],
                  ),
                ),
                TouchableOpacity(
                  onTap: () => print('cancel'),
                  child: const Icon(
                    Icons.cancel,
                    color: Color(0xFF707070),
                  ),
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
      child: const Text(
        'Withdraw',
        style: textBodyProfile,
      ),
    )),
  );
}
