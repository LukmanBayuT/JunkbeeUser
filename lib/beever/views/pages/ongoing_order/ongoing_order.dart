// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/go_to_waste_collection_points.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/location_tracking.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/ongoing_order_proceed.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class OngoingOrder extends StatefulWidget {
  const OngoingOrder({Key? key}) : super(key: key);

  @override
  _OngoingOrderState createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/heading_full.png'), fit: BoxFit.fill)),
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
            height: MediaQuery.of(context).size.height / 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => OngoingOrderProceed());
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
                      'Simulasi Beever pickup',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ), // inner content
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
