// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/widgets/profile/profile_widget.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/models/collection_data_models.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_collection.dart';

class CollectionStatusUser extends StatefulWidget {
  const CollectionStatusUser({Key? key}) : super(key: key);

  @override
  _CollectionStatusUserState createState() => _CollectionStatusUserState();
}

class _CollectionStatusUserState extends State<CollectionStatusUser> {
  bool _isChoiceSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 30,
          color: Colors.amberAccent,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/heading.png'), fit: BoxFit.cover)),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 22),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Collection Status',
                    style: bodyBodyUser,
                  ),
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
                            child: (_isChoiceSelected == true)
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        // ignore: unnecessary_const
                                        gradient: const LinearGradient(colors: [
                                          const Color(0xFFF8C503),
                                          const Color(0xFFFFE067)
                                        ]),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                              offset: Offset(0, 1))
                                        ]),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Active',
                                      style: onboardingSkipWhite,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.transparent),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Active',
                                      style: onboardingSkipWhite,
                                    ),
                                  ),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 15,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChoiceSelected = !_isChoiceSelected;
                              });
                            },
                            child: (_isChoiceSelected == false)
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        // ignore: unnecessary_const
                                        gradient: const LinearGradient(colors: [
                                          const Color(0xFFF8C503),
                                          const Color(0xFFFFE067)
                                        ]),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                              offset: Offset(0, 1))
                                        ]),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'History',
                                      style: onboardingSkipWhite,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.transparent),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'History',
                                      style: onboardingSkipWhite,
                                    ),
                                  ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (_isChoiceSelected == true) ...[
          FutureBuilder(
            future: GetCollectionData().getCollectionData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var collectiondata = snapshot.data;
                return Container(
                  transform: Matrix4.translationValues(0, -25, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      shrinkWrap: true,
                      itemCount: collectiondata.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                        offset: Offset(0, 1))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 10),
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/logo_beever.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                12,
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.4,
                                              child: const Text(
                                                'Great! we are looking for a Beever for you',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    color: Color(0xFF707070)),
                                              ))
                                        ],
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.25,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Color(0xFFDEDEDE)))),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Remaining search time: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFF8C503)),
                                          ),
                                          Text('5 minutes',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xFFF8C503)))
                                        ],
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.width /
                                        1.25,
                                    child: const Text(
                                      'Your collection request will be canclled automatically if the search timer runs out.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 25, bottom: 15),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.5,
                                              color: const Color(0xFFDEDEDE)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 20))
                          ],
                        );
                      }),
                );
                // return Container(
                //   width: 100,
                //   height: 100,
                //   color: Colors.blue,
                //   child: Text('${collectiondata.data[0].orderCode}'),
                // );
              } else {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                );
              }
            },
          ),
        ]
      ]),
    ));
  }
}
