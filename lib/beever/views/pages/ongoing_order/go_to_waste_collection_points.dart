// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/google_maps_api.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:location/location.dart';

class WasteCollectionsPoint extends StatefulWidget {
  const WasteCollectionsPoint({Key? key}) : super(key: key);

  @override
  State<WasteCollectionsPoint> createState() => _WasteCollectionsPointState();
}

class _WasteCollectionsPointState extends State<WasteCollectionsPoint> {
  LocationData? currentLocation;
  Location? location;
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  final CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  late StreamSubscription<LocationData> subscription;

  GoogleMapController? _googleMapController;

  LatLng mrDonnyCP = const LatLng(-6.9749235, 110.4218642);
  LatLng mrMarcellCP = const LatLng(-6.9870617, 110.3908796);
  LatLng mrWellyCP = const LatLng(-7.014945, 110.4162697);

  bool isMrDonny = true;
  bool isMrMarcell = false;
  bool isMrWelly = false;

  Set<Marker> markerList = {
    Marker(
        markerId: const MarkerId('Mr. Donny'),
        position: const LatLng(-6.9749235, 110.4218642),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        onTap: () {}),
    Marker(
      markerId: const MarkerId('Mr. Marcell'),
      position: const LatLng(-6.9870617, 110.3908796),
      infoWindow: const InfoWindow(
          title: 'Mr. Marcell Super Warehouse',
          snippet:
              'Jl. Puspowarno Sel. V No.26 Salamanmloyo, Kec. Semarang Barat'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: const MarkerId('Mr. Welly'),
      position: const LatLng(-7.014945, 110.4162697),
      infoWindow: const InfoWindow(
          title: 'Mr. Welly Super Warehouse',
          snippet: 'Jl. Kendalisodo No.2a, Wonotingal, Kec. Candisari'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
  };

  @override
  void initState() {
    location = Location();
    setInitialLocation();
    setMyLocation();
    super.initState();
  }

  void setMyLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    if (kDebugMode) {
      print(_locationData);
    }
  }

  void setInitialLocation() async {
    await location?.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 30,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : const LatLng(0.0, 0.0),
    );
    final CustomInfoWindowController customInfoWindowController =
        CustomInfoWindowController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          child: const Icon(Icons.center_focus_strong),
          onPressed: () {
            _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(initialCameraPosition));
            setMyLocation();
          }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text('Go to Waste Collector',
            style: titleBodyUser.copyWith(fontSize: 18, color: Colors.amber)),
        actions: [
          TextButton(
              onPressed: () {
                _googleMapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: mrDonnyCP, zoom: 19.5, tilt: 50.0),
                  ),
                );
                setState(() {
                  isMrDonny = true;
                  isMrMarcell = false;
                  isMrWelly = false;
                });
              },
              style: TextButton.styleFrom(
                  primary: Colors.orangeAccent,
                  textStyle: const TextStyle(fontWeight: FontWeight.w800)),
              child: const Text('Mr. Donny')),
          TextButton(
              onPressed: () {
                _googleMapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: mrMarcellCP, zoom: 19.5, tilt: 50.0),
                  ),
                );
                setState(() {
                  isMrDonny = false;
                  isMrMarcell = true;
                  isMrWelly = false;
                });
              },
              style: TextButton.styleFrom(
                  primary: Colors.blueAccent,
                  textStyle: const TextStyle(fontWeight: FontWeight.w800)),
              child: const Text('Mr. Marcell')),
          TextButton(
              onPressed: () {
                _googleMapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: mrWellyCP, zoom: 19.5, tilt: 50.0),
                  ),
                );
                setState(() {
                  isMrDonny = false;
                  isMrMarcell = false;
                  isMrWelly = true;
                });
              },
              style: TextButton.styleFrom(
                  primary: Colors.greenAccent,
                  textStyle: const TextStyle(fontWeight: FontWeight.w800)),
              child: const Text('Mr. Welly'))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            GoogleMap(
                onTap: (position) {
                  customInfoWindowController.hideInfoWindow!();
                },
                onCameraMove: (position) {
                  customInfoWindowController.onCameraMove!();
                },
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (controller) => _googleMapController = controller,
                markers: {
                  Marker(
                      markerId: const MarkerId('Mr. Donny'),
                      position: const LatLng(-6.9749235, 110.4218642),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                      onTap: () {
                        customInfoWindowController.addInfoWindow!(
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 10,
                              color: Colors.amber,
                            ),
                            mrDonnyCP);
                      }),
                  Marker(
                    markerId: const MarkerId('Mr. Marcell'),
                    position: const LatLng(-6.9870617, 110.3908796),
                    infoWindow: const InfoWindow(
                        title: 'Mr. Marcell Super Warehouse',
                        snippet:
                            'Jl. Puspowarno Sel. V No.26 Salamanmloyo, Kec. Semarang Barat'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                  ),
                  Marker(
                    markerId: const MarkerId('Mr. Welly'),
                    position: const LatLng(-7.014945, 110.4162697),
                    infoWindow: const InfoWindow(
                        title: 'Mr. Welly Super Warehouse',
                        snippet:
                            'Jl. Kendalisodo No.2a, Wonotingal, Kec. Candisari'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                  ),
                }),
            CustomInfoWindow(
              controller: customInfoWindowController,
              height: 75,
              width: 150,
              offset: 50,
            ),
          ],
        ),
      ),
    );
  }
}
