import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:junkbee_user/constant/constant.dart';

class UserDataGetStarted extends StatelessWidget {
  const UserDataGetStarted({
    Key? key,
    required this.navKey,
  }) : super(key: key);

  final GlobalKey<CurvedNavigationBarState> navKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get Started',
            style: titleBody,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  navKey.currentState?.setPage(2);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'New Collection',
                      style: bodyBodyUser,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'History',
                      style: bodyBodyUser,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
