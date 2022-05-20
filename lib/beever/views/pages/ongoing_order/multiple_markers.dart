// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MultipleMarkers extends StatefulWidget {
  const MultipleMarkers({Key? key}) : super(key: key);

  @override
  MultipleMarkersState createState() => MultipleMarkersState();
}

class MultipleMarkersState extends State<MultipleMarkers> {
  LatLng sourceLocation = LatLng(28.432864, 77.002563);
  LatLng mrDonnyCP = LatLng(-6.9749235, 110.4218642);
  LatLng mrMarcellCP = LatLng(-6.9749235, 110.4218642);
  LatLng mrWellyCP = LatLng(-6.9749235, 110.4218642);

  bool isMrDonny = true;
  bool isMrMarcell = false;
  bool isMrWelly = false;

  final Completer<GoogleMapController> _controller = Completer();
  final panelController = PanelController();

  final Set<Marker> _marker = <Marker>{};

  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 50,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : LatLng(0.0, 0.0),
    );

    return currentLocation == null
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              body: SlidingUpPanel(
                controller: panelController,
                parallaxEnabled: true,
                parallaxOffset: .5,
                borderRadius: roundedRect,
                body: GoogleMap(
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                  markers: _marker,
                  polylines: _polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                panelBuilder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/recycle_bin.png',
                                width: 15,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Collection Points',
                                    style: onboardingNormalText,
                                  ),
                                  Text(
                                    'Joko Widodo',
                                    style: bodyBodyBold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/point_map.png',
                                width: 15,
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Location',
                                    style: onboardingNormalText,
                                  ),
                                  Text(
                                    'Data Lokasi',
                                    style: bodyBodyBold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 20,
                          thickness: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMrMarcell = false;
                              isMrWelly = false;
                              isMrDonny = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: (isMrDonny == true)
                                          ? Colors.amber
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Mr. Donny CP',
                                      style: bodyBodyBold,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Alamat',
                                      style: onboardingNormalText,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Jl. Kanjengan Pungkuran No.383, Kauman, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50139',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMrDonny = false;
                              isMrWelly = false;
                              isMrMarcell = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: (isMrMarcell == true)
                                          ? Colors.amber
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Mr. Marcell CP',
                                      style: bodyBodyBold,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Alamat',
                                      style: onboardingNormalText,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Jl. Puspowarno Sel. V No.26 Salamanmloyo, Kec. Semarang Barat Kota Semarang, Jawa Tengah 50149',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMrDonny = false;
                              isMrMarcell = false;
                              isMrWelly = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: (isMrWelly == true)
                                          ? Colors.amber
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Mr. Welly CP',
                                      style: bodyBodyBold,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Alamat',
                                      style: onboardingNormalText,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Jl. Kendalisodo No.2a, Wonotingal, Kec. Candisari, Kota Semarang, Jawa Tengah 50252',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
