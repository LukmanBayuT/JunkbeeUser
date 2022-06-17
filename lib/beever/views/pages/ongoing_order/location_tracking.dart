import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../user/constant/constant.dart';
import '../../../service/google_maps_api.dart';

class LocationTracking extends StatefulWidget {
  const LocationTracking(
      {Key? key, required this.latUser, required this.longUser})
      : super(key: key);

  final double latUser;
  final double longUser;

  @override
  LocationTrackingState createState() => LocationTrackingState();
}

class LocationTrackingState extends State<LocationTracking> {
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;
  LatLng mrDonnyCP = const LatLng(-6.9749235, 110.4218642);
  final panelController = PanelController();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  LatLng sourceLocation = const LatLng(28.432864, 77.002563);
  late StreamSubscription<LocationData> subscription;

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _marker = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};

  List<String> images = [
    'assets/point_user.png',
    'assets/beever_motor.png',
  ];

  Uint8List? markerImage;

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    location = Location();
    polylinePoints = PolylinePoints();
    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;
      updatePinsOnMap();
    });
    setInitialLocation();
  }

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });

    destinationLocation = LocationData.fromMap({
      "latitude": mrDonnyCP.latitude,
      "longitude": mrDonnyCP.longitude,
    });
  }

  void showLocationPins() async {
    final Uint8List markerIconBeever =
        await getBytesFromAsset('assets/beever_motor.png', 50);
    final Uint8List markerIconUser =
        await getBytesFromAsset('assets/point_user.png', 50);
    var sourceposition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);
    var destinationPosition = LatLng(widget.latUser, widget.longUser);

    _marker.add(Marker(
      markerId: const MarkerId('sourcePosition'),
      position: sourceposition,
      icon: BitmapDescriptor.fromBytes(markerIconBeever),
    ));

    _marker.add(
      Marker(
        markerId: const MarkerId('destinationPosition'),
        icon: BitmapDescriptor.fromBytes(markerIconUser),
        position: destinationPosition,
      ),
    );
    setPolylinesInMap();
  }

  void setPolylinesInMap() async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleMapApi().url,
      PointLatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
      PointLatLng(widget.latUser, widget.longUser),
    );

    if (result.points.isNotEmpty) {
      for (var pointLatLng in result.points) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      }
    }

    setState(() {
      _polylines.add(Polyline(
        width: 5,
        polylineId: const PolylineId('polyline'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
      ));
    });
  }

  void updatePinsOnMap() async {
    double mainBearing = 15.0;
    final Uint8List markerIconBeever =
        await getBytesFromAsset('assets/beever_motor.png', 50);
    CameraPosition cameraPosition = CameraPosition(
      zoom: 18,
      tilt: 50,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    var sourcePosition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');
      _marker.add(Marker(
        icon: BitmapDescriptor.fromBytes(markerIconBeever),
        markerId: const MarkerId('sourcePosition'),
        position: sourcePosition,
      ));
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 50,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : const LatLng(0.0, 0.0),
    );

    return currentLocation == null
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              body: SlidingUpPanel(
                controller: panelController,
                parallaxEnabled: true,
                parallaxOffset: .5,
                borderRadius: roundedRect,
                body: GoogleMap(
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                  markers: _marker,
                  polylines: _polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    showLocationPins();
                  },
                ),
                panelBuilder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/recycle_bin.png',
                                width: 15,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Collection Points',
                                    style: onboardingNormalText,
                                  ),
                                  Text(
                                    'Joko Widodo',
                                    style: bodyBodyBold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/point_map.png',
                                width: 15,
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Location',
                                    style: onboardingNormalText,
                                  ),
                                  Text(
                                    'Data Lokasi',
                                    style: bodyBodyBold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 20,
                          thickness: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }
}
