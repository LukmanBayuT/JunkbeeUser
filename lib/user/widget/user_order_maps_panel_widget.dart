// ignore_for_file: unused_import, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/view/pages/order_process/maps_flutter.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_place/google_place.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:location/location.dart' as loc;

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
  late String? currentPosition;

  late String latitude = '';
  late String longitude = '';

  bool isChooseByLocation = true;
  bool isSearchByMap = false;

  List<AutocompletePrediction> predictions = [];

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions?.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

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
    String apiKey = 'AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k';
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
          (isChooseByLocation == true)
              ? Container(
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
                                // onChanged: (value) {
                                //   if (value.isNotEmpty) {
                                //     autoCompleteSearch(value);
                                //   } else {
                                //     print('empty');
                                //   }
                                // },
                                autofocus: false,
                                controller: _startSearchFieldController,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Search Adrress',
                                    hintStyle: onboardingNormalText)),
                          )),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: const GetUserLocation(),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
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
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChooseByLocation = true;
                      isSearchByMap = false;
                    });
                  },
                  child: const Text(
                    'Choose Location',
                    style: titleBodyMini,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChooseByLocation = false;
                      isSearchByMap = true;
                    });
                  },
                  child: const Text(
                    'Search by Map',
                    style: titleBodyMiniGreen,
                  ),
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
