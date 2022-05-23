// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/views/pages/profile/location.dart';

class SavedLocation extends StatefulWidget {
  const SavedLocation({Key? key}) : super(key: key);

  @override
  SavedLocationState createState() => SavedLocationState();
}

class SavedLocationState extends State<SavedLocation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFF8C503),
            title: const Text('Saved Location', style: textBodyProfile),
            centerTitle: true,
            leading: TouchableOpacity(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white))),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: const EdgeInsets.only(top: 35, bottom: 15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))),
              child: TouchableOpacity(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Locations(),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/group_1663.png',
                              width: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(
                                'Add Location',
                                style: textSemiBold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/union_68.png',
                        width: 15,
                        height: 15,
                      )
                    ],
                  )),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 30, bottom: 15, left: 20, right: 20),
            child: const Text(
              'Recent',
              style: textProfileBold,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 585,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/group_1664.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Gudang Y, PT Amogus',
                                          style: textProfileBoldMini,
                                        ),
                                        Text(
                                          'Jl. Mangun harjo 66, gedhangan',
                                          style: textProfile,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            TouchableOpacity(
                                onTap: () => print('delete'),
                                child: Image.asset(
                                    'assets/trash_svgrepo_com.png',
                                    width: 18))
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 15),
                          width: 430,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xFFDEDEDE)))))
                    ]);
                  }))
        ]));
  }
}
