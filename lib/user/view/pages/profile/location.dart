// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  LocationState createState() => LocationState();
}

class LocationState extends State<Location> {
  final Completer<GoogleMapController> _controller = Completer();

  // ignore: unnecessary_const
  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-6.9712568081305015, 110.42702698925254),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(-6.9712568081305015, 110.42702698925254),
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8C503),
          title: const Text(
            'Add Location',
            style: textBodyProfile,
          ),
          centerTitle: true,
          leading: TouchableOpacity(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded, size: 25)),
        ),
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.7)),
                  child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          hintText: 'Search by City',
                          suffixIcon: const Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.7),
                            borderSide: const BorderSide(
                              color: Color(0xFFDEDEDE),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.7),
                              borderSide:
                                  const BorderSide(color: Colors.blue))))))
        ]));
  }
}
