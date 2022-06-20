import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../service/api_calls_beever.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../../../../user/constant/constant.dart';
import '../../../service/google_maps_api.dart';
import '../0.navigator.dart';

class LocationTracking extends StatefulWidget {
  const LocationTracking({
    Key? key,
    required this.latUser,
    required this.longUser,
    required this.userOrder,
    required this.orderCode,
    required this.namaTempat,
    required this.alamat,
  }) : super(key: key);

  final String? alamat;
  final double latUser;
  final double longUser;
  final String? namaTempat;
  final String? orderCode;
  final String? userOrder;

  @override
  LocationTrackingState createState() => LocationTrackingState();
}

class LocationTrackingState extends State<LocationTracking> {
  LocationData? currentLocation;
  late LocationData destinationLocation;
  List<String> images = [
    'assets/point_user.png',
    'assets/beever_motor.png',
  ];
  final List<String> categoryItems = [
    'Mix_Paper',
    'Paper',
  ];

  String? selectedCategory;

  bool isCompleted = false;
  bool isFinished = false;
  bool isLastScreen = false;
  bool isLastScreenText = false;
  bool isOnPickUp = false;
  bool isOnPickUpText = false;
  bool isOnTheWay = true;
  bool isOnTheWayText = false;
  bool isWeightConfirmation = false;
  bool isWeightConfirmationText = false;
  bool isLengkap = false;
  late Location location;
  Uint8List? markerImage;
  final panelController = PanelController();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  late StreamSubscription<LocationData> subscription;

  final TextEditingController _beratSampah = TextEditingController();
  final TextEditingController _hargaSampah = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _marker = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};

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

    // destinationLocation = LocationData.fromMap({
    //   "latitude": mrDonnyCP.latitude,
    //   "longitude": mrDonnyCP.longitude,
    // });
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
    // double mainBearing = 15.0;
    // final Uint8List markerIconBeever =
    //     await getBytesFromAsset('assets/beever_motor.png', 50);
    CameraPosition cameraPosition = CameraPosition(
      zoom: 18,
      tilt: 50,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    // var sourcePosition = LatLng(
    //     currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');
      // _marker.add(Marker(
      //   icon: BitmapDescriptor.fromBytes(markerIconBeever),
      //   markerId: const MarkerId('sourcePosition'),
      //   position: sourcePosition,
      // ));
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

    final panelHeightOpen = Get.height * 0.35;
    final panelHeightClosed = Get.height * 0.175;

    final panelHeightOpenFinal = Get.height * 0.8;
    final panelHeightClosedFinal = Get.height * 0.175;

    return currentLocation == null
        ? Container(
            height: Get.height,
            width: Get.width,
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
                minHeight: (isLastScreen == true)
                    ? panelHeightClosedFinal
                    : panelHeightClosed,
                maxHeight: (isLastScreen == true)
                    ? panelHeightOpenFinal
                    : panelHeightOpen,
                body: GoogleMap(
                  myLocationEnabled: true,
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
                                children: [
                                  const Text(
                                    'Nama User',
                                    style: onboardingNormalText,
                                  ),
                                  Text(
                                    widget.userOrder!,
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
                                children: [
                                  const Text(
                                    'Lokasi Pickup',
                                    style: onboardingNormalText,
                                  ),
                                  SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                      widget.namaTempat!,
                                      style: bodyBodyBold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                      widget.alamat!,
                                      style: bodyBody,
                                    ),
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
                        (isOnTheWay == true)
                            ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.amber,
                                            shape: roundedRectBor),
                                        child: const Text('Pick Up',
                                            style: onboardingGetStarted),
                                        onPressed: () {
                                          if (mounted) {
                                            setState(() {
                                              isOnTheWay = false;
                                              isOnTheWayText = true;
                                              isOnPickUp = true;
                                            });
                                          }
                                        },
                                      )),
                                ),
                              )
                            : Container(),
                        (isOnPickUp == true)
                            ? Padding(
                                padding: const EdgeInsets.all(20),
                                child: SwipeableButtonView(
                                  buttonText: 'Arrived at The Pickup',
                                  buttonWidget: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.grey,
                                  ),
                                  activeColor:
                                      const Color.fromARGB(255, 247, 172, 12),
                                  isFinished: isFinished,
                                  onWaitingProcess: () {
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        isFinished = true;
                                      });
                                    });
                                  },
                                  onFinish: () async {
                                    setState(() {
                                      isOnTheWay = false;
                                      isOnPickUp = false;
                                      isOnPickUpText = true;
                                      isLastScreen = true;
                                      isFinished = false;
                                    });
                                  },
                                ),
                              )
                            : Container(),
                        (isLastScreen == true)
                            ? Column(children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: Get.height * 0.5,
                                  width: Get.width / 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Category',
                                        style: bodyBodyBold,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: Get.width,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                              hint:
                                                  const Text('Kategori Sampah'),
                                              value: selectedCategory,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedCategory =
                                                      value as String;
                                                });
                                              },
                                              items: categoryItems
                                                  .map((categoryItems) =>
                                                      DropdownMenuItem<String>(
                                                        value: categoryItems,
                                                        child: Text(
                                                          categoryItems,
                                                          style: bodyBody,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ))
                                                  .toList()),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Total Weight',
                                        style: bodyBodyBold,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: 'Total Kilo',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.7),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.7),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFDEDEDE),
                                              width: 2.0,
                                            ),
                                          ),
                                          counterText: '',
                                        ),
                                        controller: _beratSampah,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Harga Yang Disepakati',
                                        style: bodyBodyBold,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: 'Total Harga',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.7),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.7),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFDEDEDE),
                                              width: 2.0,
                                            ),
                                          ),
                                          counterText: '',
                                        ),
                                        controller: _hargaSampah,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          width: Get.width / 5,
                                          height: Get.height / 20,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.amber,
                                                shape: roundedRectBor),
                                            child: Text('Confirm',
                                                style: onboardingGetStarted
                                                    .copyWith(fontSize: 12)),
                                            onPressed: () {
                                              if (_beratSampah.text.isNotEmpty &&
                                                  _hargaSampah
                                                      .text.isNotEmpty &&
                                                  selectedCategory != null) {
                                                BeeverApi().beeverConfirm(
                                                    widget.orderCode!,
                                                    _beratSampah.text,
                                                    _hargaSampah.text,
                                                    selectedCategory);
                                                setState(() {
                                                  isLengkap = true;
                                                });
                                              } else {
                                                showDialogue();
                                              }
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                                (isLengkap == true)
                                    ? Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: SwipeableButtonView(
                                          buttonText: 'Weight Confirmation',
                                          buttonWidget: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey,
                                          ),
                                          activeColor: const Color.fromARGB(
                                              255, 247, 172, 12),
                                          isFinished: isFinished,
                                          onWaitingProcess: () {
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              setState(() {
                                                isFinished = true;
                                              });
                                            });
                                          },
                                          onFinish: () async {
                                            await Navigator.pushReplacement(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        const NavigatorPages()));
                                            setState(() {
                                              isOnTheWay = true;
                                              isOnTheWayText = false;
                                              isOnPickUp = false;
                                              isOnPickUpText = false;
                                              isLastScreen = false;
                                              isLastScreenText = false;
                                              isFinished = false;
                                              isFinished = false;
                                            });
                                          },
                                        ),
                                      )
                                    : const SizedBox(),
                              ])
                            : Container()
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }

  showDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
              title: const Text('Mohon Diisi!'),
              content: const Text('Pastikan semua sudah lengkap dan diisi'),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('OK',
                        style: bodySlimBody.copyWith(color: Colors.white)))
              ]);
          return dialog;
        });
  }
}
