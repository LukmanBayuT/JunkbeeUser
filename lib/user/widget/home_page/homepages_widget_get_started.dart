import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/view/collection_status_user.dart';
import 'package:junkbee_user/user/view/order_screen.dart';

class UserDataGetStarted extends StatelessWidget {
  const UserDataGetStarted({Key? key, required this.navKey}) : super(key: key);

  final GlobalKey<CurvedNavigationBarState> navKey;

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(0, -50, 0),
        width: MediaQuery.of(context).size.width / 1.15,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Get Started', style: titleBodyMini),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  Get.to(() => const UserOrderScreen());
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child:
                            Text('New Collection', style: bodyBodyUserMini)))),
            GestureDetector(
                onTap: () {
                  Get.to(() => const CollectionStatusUserOut());
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text('History', style: bodyBodyUserMini))))
          ])
        ]));
  }
}
