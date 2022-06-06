// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/model/collection_model.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/confirmation_order_screen.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/go_to_waste_collection_points.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/location_tracking.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/multiple_markers.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/ongoing_order_proceed.dart';
import 'package:junkbee_user/beever/widgets/ongoing_message/ongoingMessage_widget.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class OngoingOrder extends StatefulWidget {
  const OngoingOrder({Key? key}) : super(key: key);

  @override
  OngoingOrderState createState() => OngoingOrderState();
}

class OngoingOrderState extends State<OngoingOrder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/heading_full.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const LocationTracking());
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white, // border color
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5), // border width
                  child: Container(
                    // or ClipRRect if you need to clip the content
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber, // inner circle color
                    ),
                    child: const Center(
                      child: Text(
                        'Go to Waste Collector',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ), // inner content
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            FutureBuilder<CollectionModelBeever>(
              future: ApiCallsGetCollection().getCollectionData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var collectionData = snapshot.data;
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.35,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 70),
                      shrinkWrap: true,
                      itemCount: collectionData.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          spreadRadius: 0.0,
                                          offset: Offset(0, 1))
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 17, left: 10, right: 10),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                      width: 28,
                                                      child: Image.asset(
                                                          'assets/group_2262.png')),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                          'Order From \n ${collectionData.data[index].fullName}',
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFF707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16)))
                                                ]),
                                            SizedBox(
                                              width: 100,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Get.to(() =>
                                                      ConfirmationOrderScreen(
                                                          orderCode:
                                                              '${collectionData.data[index].orderCode}'));
                                                },
                                                child: const Text('Detail',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    )),
                                              ),
                                            )
                                          ]),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10.5),
                                      width: 390,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1.0,
                                                  color: Color(0xFFDEDEDE)))),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 17, left: 10, right: 10),
                                        child: Row(children: [
                                          Image.asset('assets/group_971.png',
                                              width: 30, height: 30),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        'Pick Up Location',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF707070),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15)),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.4,
                                                          child: Text(
                                                              "${collectionData.data[index].location1}",
                                                              style: const TextStyle(
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize:
                                                                      15)),
                                                        ))
                                                  ]))
                                        ])),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 10,
                                            right: 10,
                                            bottom: 29),
                                        child: Row(children: [
                                          Image.asset('assets/group_2267.png',
                                              width: 30),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                  'Order Code : ${collectionData.data[index].orderCode}',
                                                  style: const TextStyle(
                                                      color: Color(0xFF707070),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15)))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 15)
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
