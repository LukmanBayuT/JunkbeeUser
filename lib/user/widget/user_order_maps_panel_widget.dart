import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_place/google_place.dart';

class PanelWidget extends StatefulWidget {
  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  final ScrollController controller;
  final PanelController panelController;

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final _startSearchFieldController = TextEditingController();
  late GooglePlace googlePlace;

  late String latitude = '';
  late String longitude = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    setState(() {
      latitude = "$lat";
      longitude = "$long";
    });
  }

  @override
  void initState() {
    String apiKey = 'AIzaSyC8DFp6srzvTmC3KF0o_dAjkoP1iVWNbYs';
    googlePlace = GooglePlace(apiKey);
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView(
        controller: widget.controller,
        padding: defaultPadding0,
        children: [
          const SizedBox(
            height: 15,
          ),
          buildDragHandler(),
          const SizedBox(
            height: 35,
          ),
          buildMapsContent(),
          Container(
            margin: defaultPadding9,
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
              borderRadius: roundedRect,
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'icons/icons_others/ico_location.png',
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 14,
                    child: Center(
                      child: TextField(
                          autofocus: false,
                          controller: _startSearchFieldController,
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Search Adrress',
                              hintStyle: onboardingNormalText)),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                Text(latitude),
                Text(longitude),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: mainColor2, shape: roundedRectBor),
              child: const Text(
                'Minta Lokasi',
                style: onboardingGetStarted,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: mainColor2, shape: roundedRectBor),
              child: const Text(
                'Print Lat Long',
                style: onboardingGetStarted,
              ),
              onPressed: () {
                print(latitude);
                print(longitude);
              },
            ),
          )
        ],
      );

  Widget buildDragHandler() => GestureDetector(
        onTap: togglePanel,
        child: Center(
          child: Container(
            width: 200,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: roundedRect),
          ),
        ),
      );

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();

  Widget buildMapsContent() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Choose Location',
                  style: titleBodyMini,
                ),
                Text(
                  'Search by Map',
                  style: titleBodyMiniGreen,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
}
