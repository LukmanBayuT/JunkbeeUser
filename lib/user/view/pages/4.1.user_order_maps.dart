import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/widget/user_order_maps_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserOrderMaps extends StatefulWidget {
  const UserOrderMaps({Key? key}) : super(key: key);

  @override
  State<UserOrderMaps> createState() => _UserOrderMapsState();
}

class _UserOrderMapsState extends State<UserOrderMaps> {
  final panelController = PanelController();
  final CameraPosition _initialPosition =
      const CameraPosition(target: LatLng(-6.9714841, 110.4266806), zoom: 19);

  @override
  Widget build(BuildContext context) {
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
          initialCameraPosition: _initialPosition,
          mapType: MapType.normal,
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
      ),
    );
  }
}
