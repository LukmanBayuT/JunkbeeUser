// ignore_for_file: unused_import, avoid_print, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables
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
import 'package:junkbee_user/user/view/pages/order_process/user_order_processed.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_place/google_place.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;

class PanelWidget extends StatefulWidget {
  PanelWidget({
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

  DetailsResult? startPosition;

  FocusNode? startFocusNode;

  String? address;

  @override
  void initState() {
    super.initState();
    String apiKey = 'AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k';
    googlePlace = GooglePlace(apiKey);
    startFocusNode = FocusNode();
    getCurrentLocation();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      // print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    } else {
      print('no data found');
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
  void dispose() {
    super.dispose();
    startFocusNode!.dispose();
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
            height: MediaQuery.of(context).size.height / 13,
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
                        focusNode: startFocusNode,
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) _debounce!.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 1000), () {
                            if (value.isNotEmpty) {
                              autoCompleteSearch(value);
                            } else {
                              setState(() {
                                predictions = [];
                                startPosition = null;
                              });
                            }
                          });
                        },
                        autofocus: false,
                        controller: _startSearchFieldController,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon:
                                _startSearchFieldController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            predictions = [];
                                            _startSearchFieldController.clear();
                                          });
                                        },
                                        icon: const Icon(Icons.clear_outlined))
                                    : null,
                            hintText: 'Search Address',
                            hintStyle: onboardingNormalText)),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: predictions.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.pin_drop),
                ),
                title: Text(
                  predictions[index].description.toString(),
                  style: bodySlimBody,
                ),
                onTap: () async {
                  final placeId = predictions[index].placeId!;
                  final details = await googlePlace.details.get(placeId);

                  if (details != null && details.result != null && mounted) {
                    if (startFocusNode!.hasFocus) {
                      setState(() {
                        startPosition = details.result;
                        _startSearchFieldController.text =
                            details.result!.formattedAddress!;
                        predictions = [];
                        address = _startSearchFieldController.text;
                      });
                    }
                  }
                },
              );
            },
          ),
          const SizedBox(height: 10),
          (_startSearchFieldController.text.isNotEmpty)
              ? SizedBox(
                  width: 100,
                  height: 300,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Lokasi Kamu : ',
                          style:
                              onboardingGetStarted.copyWith(color: mainColor1),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _startSearchFieldController.text,
                          style: onboardingNormalText,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.height / 13,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.amber, shape: roundedRectBor),
                              child: const Text('Ya ini alamat saya',
                                  style: onboardingGetStarted),
                              onPressed: () {
                                Get.back(
                                    result: _startSearchFieldController.text);
                              },
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              : Container()
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
