// ignore_for_file: unnecessary_const, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class UserMessages extends StatefulWidget {
  const UserMessages({Key? key}) : super(key: key);

  @override
  _UserMessagesState createState() => _UserMessagesState();
}

class _UserMessagesState extends State<UserMessages> {
  bool _isChoiceSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 30,
              color: Colors.amberAccent,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(image: const DecorationImage(image: AssetImage('assets/heading.png'), fit: BoxFit.cover)),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 22),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topCenter,
                      child: const Text('Messages', style: bodyBodyUser,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 15,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isChoiceSelected = !_isChoiceSelected;
                                });
                              },
                              child: (_isChoiceSelected == true) ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(colors: [const Color(0xFFF8C503), const Color(0xFFFFE067)]),
                                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))]
                                ),
                                alignment: Alignment.center,
                                child: const Text('Chat', style: onboardingSkipWhite,),
                              ) : Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.transparent
                                ),
                                alignment: Alignment.center,
                                child: const Text('Chat', style: onboardingSkipWhite,),
                              ),
                            )
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 15,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isChoiceSelected = !_isChoiceSelected;
                                });
                              },
                              child: (_isChoiceSelected == false) ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(colors: [const Color(0xFFF8C503), const Color(0xFFFFE067)]),
                                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))]
                                ),
                                alignment: Alignment.center,
                                child: const Text('Inbox', style: onboardingSkipWhite,),
                              ) : Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.transparent
                                ),
                                alignment: Alignment.center,
                                child: const Text('Inbox', style: onboardingSkipWhite,),
                              ),
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            if (_isChoiceSelected == true) ...[
              Container(
                transform: Matrix4.translationValues(0, -25, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4,
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))]
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 15, bottom: 10),
                                width: MediaQuery.of(context).size.width / 1.15,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/beever_image.png', width: MediaQuery.of(context).size.width / 7,),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      width: MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(top: 2, bottom: 10),
                                            child: const Text('Mr. Sunaryo - Beever', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF707070)),)
                                          ),
                                          const Text('How its going Miss?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF707070)), maxLines: 1)
                                        ],
                                      )
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 2),
                                      width: MediaQuery.of(context).size.width / 4.6,
                                      alignment: Alignment.topRight,
                                      child: const Text('Today', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF707070)),)
                                    )
                                  ],
                                )
                              )
                            ],
                          )
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20))
                      ],
                    );
                  }
                ),
              )
            ]
          ]
        ),
      )
    );
  }
}
