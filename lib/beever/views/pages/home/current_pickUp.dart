// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/widgets/home/current_widget.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({Key? key}) : super(key: key);

  @override
  CurrentState createState() => CurrentState();
}

class CurrentState extends State<CurrentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(children: [
                      Container(
                          width: 480,
                          height: 230,
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/heading.png'),
                                  fit: BoxFit.fill)),
                          child: const CurrentWidget()),
                      Container(
                          transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                          width: 480,
                          height: 740,
                          alignment: Alignment.topCenter,
                          child: const CurrentList())
                    ])))));
  }
}
