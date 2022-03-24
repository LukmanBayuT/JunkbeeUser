// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class HelpCentreWidget extends StatelessWidget {
  const HelpCentreWidget({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/group_2239.png'), fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_rounded, size: 22, color: Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.topCenter,
                  child: const Text('Help Centre', style: bodyBodyUserBold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi Joko,', style: bodyBodyMini),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: const Text('We Are Ready', style: bodyBodyUserBold)
                ),
                const Text('To Help You', style: bodyBodyUserBold)
              ],
            ),
          )
        ],
      ),
    );
  }
}

SizedBox AllTopics(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('All Topics', style: bodyBodyBold),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))
          ),
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Frequently Asked Questions', style: bodySlimBody),
                Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFF707070),)
              ],
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))
          ),
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Payment Issue', style: bodySlimBody),
                Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFF707070),)
              ],
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))
          ),
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('About My Account', style: bodySlimBody),
                Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFF707070),)
              ],
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))
          ),
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('App Issue', style: bodySlimBody),
                Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFF707070),)
              ],
            ),
          )
        )
      ],
    ),
  );
}

class RecentActivity extends StatelessWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Text('Need Help With Your Recent Activity?', style: bodyBodyBold)
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))]
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        children: [
                          Image.asset('assets/recycle_icon.png', width: MediaQuery.of(context).size.width / 10),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Collection Successful', style: bodyBodyBold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(border: Border.all(width: 1, color: Color(0xFFDEDEDE)), borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('09:30 | 11 Jul 2021', style: bodySlimBody),
                          Text('Collection Nr.:37432', style: bodySlimBody)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}

SizedBox FindMoreHelp(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: Text('Find More Help', style: bodyBodyBold),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 7,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/group_2237.png'), fit: BoxFit.cover)),
          child: Row(
            children: [
              Container(width: MediaQuery.of(context).size.width / 3),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Still Need Help?', style: bodyBodyMini),
                    Container(
                      padding: const EdgeInsets.only(top: 1, bottom: 10),
                      child: Text('Fastest way to get help', style: bodySlimBodyWhite),
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: MediaQuery.of(context).size.height / 19,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Text('Chat With Us', style: bodySlimBodyColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 21, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Or you can ', style: bodySlimBody),
              GestureDetector(
                child: Text('MAIL US', style: bodySlimBodySemi),
              )
            ],
          ),
        )
      ],
    ),
  );
}