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

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 30,
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
        body: GoogleMap(initialCameraPosition: initialCameraPosition),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
      ),
    );
  }
}
