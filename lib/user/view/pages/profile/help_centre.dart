// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/widget/profile/helpCentre_widget.dart';

class HelpCentre extends StatefulWidget {
  const HelpCentre({Key? key}) : super(key: key);

  @override
  HelpCentreState createState() => HelpCentreState();
}

class HelpCentreState extends State<HelpCentre> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220),
        child: HelpCentreWidget()
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                width: MediaQuery.of(context).size.width / 1.1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12, right: 10),
                        child: Image.asset('assets/search_icon.png', width: MediaQuery.of(context).size.width / 18),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.32,
                        child: TextFormField(
                          style: bodyBody,
                          decoration: const InputDecoration(
                            hintText: 'Search Help',
                            hintStyle: bodyBody,
                            border: InputBorder.none
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              AllTopics(context),
              const RecentActivity(),
              FindMoreHelp(context)
            ],
          )
        )
      ),
    );
  }
}