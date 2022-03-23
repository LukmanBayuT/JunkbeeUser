// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/go_to_waste_collection_points.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/location_tracking.dart';

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
      child: Center(
          child: GestureDetector(
        onTap: () {
          Get.to(() => const LocationTracking());
        },
        child: const Icon(
          Icons.maps_home_work_rounded,
          size: 100,
          color: Colors.amber,
        ),
      )),
    );
  }
}
