// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/user/view/pages/order_process/user_order_processed.dart';
import 'package:location/location.dart';

class GetUserLocation extends StatefulWidget {
  const GetUserLocation({
    Key? key,
  }) : super(key: key);

  @override
  _GetUserLocationState createState() => _GetUserLocationState();
}

class _GetUserLocationState extends State<GetUserLocation> {
  LocationData? currentLocation;
  String address = "";

  @override
  void initState() {
    super.initState();
    _getLocation().then((value) {
      LocationData? location = value;
      _getAddress(location?.latitude, location?.longitude).then((value) {
        setState(() {
          currentLocation = location;
          address = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (currentLocation != null)
                Text(
                  "Location: ${currentLocation?.latitude}, ${currentLocation?.longitude}",
                  style: bodySlimBody,
                ),
              const SizedBox(
                height: 10,
              ),
              if (currentLocation != null)
                Text(
                  address,
                  style: bodyBoldBody,
                  textAlign: TextAlign.center,
                ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor2, shape: roundedRectBor),
                    child: Text(
                        (address == "")
                            ? 'Mohon tunggu sebentar'
                            : 'Ya ini alamat saya!',
                        style: onboardingGetStarted),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<LocationData?> _getLocation() async {
    Location location = Location();
    LocationData _locationData;
    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<String> _getAddress(double? lat, double? lang) async {
    try {
      if (lat == null || lang == null) return "";
      GeoCode geoCode = GeoCode();
      Address address =
          await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
      return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
    } catch (e) {
      print(e);
    }

    return address;
  }
}
