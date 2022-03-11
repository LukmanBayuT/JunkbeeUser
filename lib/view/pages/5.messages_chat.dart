import 'package:flutter/material.dart';
import 'package:junkbee_user/constant/constant.dart';

class UserMessages extends StatefulWidget {
  const UserMessages({Key? key}) : super(key: key);

  @override
  _UserMessagesState createState() => _UserMessagesState();
}

class _UserMessagesState extends State<UserMessages> {
  bool _isMessagesSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Messages',
          style: onboardingGetStarted,
        ),
        centerTitle: true,
        backgroundColor: mainColor2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Image.asset('assets/heading.png'),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: roundedRectBor,
                          primary: (_isMessagesSelected == true)
                              ? Colors.amber
                              : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _isMessagesSelected = !_isMessagesSelected;
                        });
                      },
                      child: const Text(
                        'Chat',
                        style: onboardingSkipWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: roundedRectBor,
                          primary: (_isMessagesSelected == false)
                              ? Colors.amber
                              : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _isMessagesSelected = !_isMessagesSelected;
                        });
                      },
                      child: const Text(
                        'Inbox',
                        style: onboardingSkipWhite,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
