import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/view/pages/order_process/user_order_maps_panel_widget.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UserOrderMaps extends StatefulWidget {
  const UserOrderMaps({Key? key}) : super(key: key);

  @override
  State<UserOrderMaps> createState() => _UserOrderMapsState();
}

class _UserOrderMapsState extends State<UserOrderMaps> {
  final panelController = PanelController();
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

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
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 45,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : const LatLng(-6.9714229, 110.4265293),
    );
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosed = MediaQuery.of(context).size.height / 13;

    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        parallaxEnabled: true,
        parallaxOffset: .5,
        borderRadius: roundedRect,
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpen,
        body: GoogleMap(
          padding: const EdgeInsets.only(
            top: 40.0,
          ),
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            if (_origin != null) _origin!,
            // if (_destination != null) _destination!
          },
          onTap: _addMarker,
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
      ),
    );
  }

  void _addMarker(LatLng argument) {
    setState(() {
      _origin = Marker(
          markerId: const MarkerId('Tempat Saya'),
          infoWindow: const InfoWindow(title: 'Posisi Saya'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          position: argument);
      _destination = null;
    });
    // if (_origin == null || (_origin != null && _destination != null)) {
    //   setState(() {
    //     _origin = Marker(
    //         markerId: const MarkerId('origin'),
    //         infoWindow: const InfoWindow(title: 'Origin'),
    //         icon: BitmapDescriptor.defaultMarkerWithHue(
    //             BitmapDescriptor.hueAzure),
    //         position: argument);
    //     _destination = null;
    //   });
    // } else {
    //   setState(() {
    //     _destination = Marker(
    //         markerId: const MarkerId('destination'),
    //         infoWindow: const InfoWindow(title: 'Destination'),
    //         icon:
    //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    //         position: argument);
    //   });
    // }
  }
}
