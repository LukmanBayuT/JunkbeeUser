import 'package:flutter/material.dart';

import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/widget/user_order_maps_panel_widget.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class UserOrderMaps extends StatefulWidget {
  const UserOrderMaps({Key? key}) : super(key: key);

  @override
  State<UserOrderMaps> createState() => _UserOrderMapsState();
}

class _UserOrderMapsState extends State<UserOrderMaps> {
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
        body: Container(),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
      ),
    );
  }
}
