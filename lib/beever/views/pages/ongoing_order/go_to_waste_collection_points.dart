// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class WasteCollectionsPoint extends StatefulWidget {
  const WasteCollectionsPoint({Key? key}) : super(key: key);

  @override
  State<WasteCollectionsPoint> createState() => _WasteCollectionsPointState();
}

class _WasteCollectionsPointState extends State<WasteCollectionsPoint> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(-6.9714229, 110.4265293), zoom: 16.0);

  GoogleMapController? _googleMapController;

  Marker? _origin;
  Marker? _destination;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          child: const Icon(Icons.center_focus_strong),
          onPressed: () {
            _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition));
          }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text('Go to Waste Collector',
            style: titleBodyUser.copyWith(fontSize: 18, color: Colors.amber)),
        actions: [
          if (_origin != null)
            TextButton(
                onPressed: () => _googleMapController!.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: _origin!.position, zoom: 19.5, tilt: 50.0),
                      ),
                    ),
                style: TextButton.styleFrom(
                    primary: Colors.green,
                    textStyle: const TextStyle(fontWeight: FontWeight.w800)),
                child: const Text('Origin')),
          if (_destination != null)
            TextButton(
                onPressed: () => _googleMapController!.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: _destination!.position,
                            zoom: 19.5,
                            tilt: 50.0),
                      ),
                    ),
                style: TextButton.styleFrom(
                    primary: const Color.fromARGB(255, 36, 92, 37),
                    textStyle: const TextStyle(fontWeight: FontWeight.w800)),
                child: const Text('Destination'))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            if (_origin != null) _origin!,
            if (_destination != null) _destination!
          },
          onTap: _addMarker,
        ),
      ),
    );
  }

  void _addMarker(LatLng argument) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
            markerId: const MarkerId('origin'),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            position: argument);
        _destination = null;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: const MarkerId('destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: argument);
      });
    }
  }
}
