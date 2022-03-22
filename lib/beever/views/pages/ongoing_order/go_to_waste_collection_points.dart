import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WasteCollectionsPoint extends StatefulWidget {
  const WasteCollectionsPoint({Key? key}) : super(key: key);

  @override
  State<WasteCollectionsPoint> createState() => _WasteCollectionsPointState();
}

class _WasteCollectionsPointState extends State<WasteCollectionsPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FlutterMap(
          options:
              MapOptions(center: LatLng(-6.9714229, 110.4265293), zoom: 18.0),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            )
          ],
        ),
      ),
    );
  }
}
