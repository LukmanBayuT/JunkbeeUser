import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/widget/user_order_maps_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UserOrderMapbox extends StatefulWidget {
  const UserOrderMapbox({Key? key}) : super(key: key);

  @override
  State<UserOrderMapbox> createState() => _UserOrderMapboxState();
}

class _UserOrderMapboxState extends State<UserOrderMapbox> {
  final panelController = PanelController();

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
        body: FlutterMap(
          options:
              MapOptions(center: LatLng(6.9714229, 110.4265293), zoom: 13.0),
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
      ),
    );
  }
}
