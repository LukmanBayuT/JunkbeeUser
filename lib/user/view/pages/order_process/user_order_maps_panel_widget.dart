// ignore_for_file: unused_import, avoid_print, curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/widgets/profile/profile_widget.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/models/geocoding_model.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_geocoding.dart';
import 'package:junkbee_user/user/view/pages/order_process/maps_flutter.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_place/google_place.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;

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
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

  late String latitude;
  late String longitude;

  bool isChooseByLocation = true;
  bool isSearchByMap = false;

  @override
  void initState() {
    super.initState();
    String apiKey = 'AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k';
    googlePlace = GooglePlace(apiKey);
    getCurrentLocation();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
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
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce!.cancel();
                                  _debounce = Timer(
                                      const Duration(milliseconds: 1000), () {
                                    if (value.isNotEmpty) {
                                      //places api
                                      autoCompleteSearch(value);
                                    } else {
                                      //clear out the results
                                    }
                                  });
                                },
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
                        // child: ElevatedButton(
                        //     onPressed: getGeocodeLocation,
                        //     child: const Text('print')),
                        child: FutureBuilder(
                          future: GetLocationGeocoding().getCurrentLocation(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var userloc = snapshot.data;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${userloc?.results[0].formattedAddress}',
                                  ),
                                  const SizedBox(width: 30),
                                ],
                              );
                            } else {
                              return const Center(
                                  child:
                                      SpinKitWave(size: 50, color: mainColor0));
                            }
                          },
                        ),
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
