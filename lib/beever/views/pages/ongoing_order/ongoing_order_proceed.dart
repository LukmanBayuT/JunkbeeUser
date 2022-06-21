// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/service/google_maps_api.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OngoingOrderProceed extends StatefulWidget {
  OngoingOrderProceed(
      {Key? key,
      required this.latUser,
      required this.longUser,
      required this.userOrder,
      required this.namaTempat,
      required this.alamat,
      required this.orderCode,
      required this.latBeever,
      required this.longBeever})
      : super(key: key);

  String alamat;
  double latBeever;
  //macam - variabel
  double latUser;

  double longBeever;
  double longUser;
  String namaTempat;
  String orderCode;
  //controller over here
  var panelController = PanelController();

  String userOrder;

  @override
  State<OngoingOrderProceed> createState() => _OngoingOrderProceedState();
}

class _OngoingOrderProceedState extends State<OngoingOrderProceed> {
  LocationData? currentLocation;
  bool haspermission = false;
  List<String> images = [
    'assets/point_user.png',
    'assets/beever_motor.png',
  ];

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
  late double latBeever = widget.latBeever;
  late double latUser = widget.latUser;
  //set polylines
  late Location location;

  late double longBeever = widget.longBeever;
  late double longUser = widget.longUser;
  //variabel markers
  Uint8List? markerImage;

  final panelController = PanelController();
  late LocationPermission permission;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  late Position position;
  late StreamSubscription<Position> positionStream;
  //variabel macam-macam
  bool servicestatus = false;

  late StreamSubscription<LocationData> subscription;
  late LatLng userLocation = LatLng(latUser, longUser);

  final TextEditingController _beratSampah = TextEditingController();
  //Completer
  final Completer<GoogleMapController> _controller = Completer();

  //controller disini
  final TextEditingController _jenisSampah = TextEditingController();

  late final List<LatLng> _latLang = <LatLng>[
    LatLng(latUser, longUser),
    LatLng(latBeever, longBeever)
  ];

  final List<Marker> _markers = <Marker>[];
  final Set<Polyline> _polylines = <Polyline>{};

  @override
  void initState() {
    super.initState();
    loadData();
    location = Location();
    polylinePoints = PolylinePoints();
    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;
      updatePinsOnMap();
    });
  }

  //Making Marker//
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markerIcon = await getBytesFromAsset(images[i], 80);
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: _latLang[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
        ),
      );
      if (mounted) {
        setState(() {});
      }
    }
  }

  void setPolylinesInMap() async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleMapApi().url,
      PointLatLng(latBeever, longBeever),
      PointLatLng(latUser, longUser),
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

  void showLocationPins() {
    var sourceposition = LatLng(latBeever, longBeever);

    _markers.add(Marker(
      markerId: const MarkerId('sourcePosition'),
      position: sourceposition,
    ));
    setPolylinesInMap();
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 18,
      tilt: 50,
      target: LatLng(latBeever, longBeever),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    var sourcePosition = LatLng(latBeever, longBeever);

    setState(() {
      _markers.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');
      _markers.add(Marker(
        markerId: const MarkerId('Beever Position'),
        position: sourcePosition,
      ));
    });
  }

  Widget buildDragHandler() => GestureDetector(
        onTap: togglePanel,
        child: Center(
          child: Container(
            width: 200,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: roundedRect),
          ),
        ),
      );

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 30,
      target: LatLng(userLocation.latitude, userLocation.longitude),
    );
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.35;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;

    final panelHeightOpenFinal = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosedFinal = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        parallaxEnabled: true,
        parallaxOffset: .5,
        borderRadius: roundedRect,
        minHeight:
            (isLastScreen == true) ? panelHeightClosedFinal : panelHeightClosed,
        maxHeight:
            (isLastScreen == true) ? panelHeightOpenFinal : panelHeightOpen,
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              // myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                showLocationPins();
              },
              markers: Set<Marker>.of(_markers),
              polylines: Set<Polyline>.of(polylines.values),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ExpansionTile(
                    leading: Image.asset(
                      'assets/logo_beever.png',
                      width: 30,
                    ),
                    collapsedBackgroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    title: const Text(
                      'Great You Got The Order!',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF707070)),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/bola_kuning.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('On The Way',
                                style: (isOnTheWayText == false)
                                    ? onboardingGetStartedGrey
                                    : onboardingGetStartedYellow)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/bola_kuning.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Pick Up Point',
                              style: (isOnPickUpText == false)
                                  ? onboardingGetStartedGrey
                                  : onboardingGetStartedYellow,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/bola_kuning.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Weight Confirmation',
                              style: (isWeightConfirmationText == false)
                                  ? onboardingGetStartedGrey
                                  : onboardingGetStartedYellow,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/bola_kuning.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Completed',
                              style: (isLastScreenText == false)
                                  ? onboardingGetStartedGrey
                                  : onboardingGetStartedYellow,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/recycle_bin.png',
                        width: 15,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nama Pemesan',
                            style: onboardingNormalText,
                          ),
                          Text(
                            widget.userOrder,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.namaTempat,
                                style: bodyBodyBold,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: Text(
                                  widget.alamat,
                                  style: bodyBodyBold.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 5,
                  thickness: 2,
                ),
                (isOnTheWay == true)
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1,
                              height: MediaQuery.of(context).size.height / 10,
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
                          buttonWidget: Container(
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          activeColor: const Color.fromARGB(255, 247, 172, 12),
                          isFinished: isFinished,
                          onWaitingProcess: () {
                            Future.delayed(const Duration(seconds: 2), () {
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
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width / 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Category',
                                style: bodyBodyBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Jenis Sampah',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.7),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.7),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDEDEDE),
                                      width: 2.0,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.7),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.7),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  counterText: '',
                                ),
                                controller: _jenisSampah,
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
                                decoration: InputDecoration(
                                  hintText: 'Total Kilo',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.7),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.7),
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
                                height: 10,
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 13,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.amber,
                                        shape: roundedRectBor),
                                    child: Text('Confirm',
                                        style: onboardingGetStarted.copyWith(
                                            fontSize: 18)),
                                    onPressed: () {
                                      // BeeverApi().beeverConfirm(
                                      //     widget.orderCode,
                                      //     totalWeight,
                                      //     total,
                                      //     wasteType);
                                    },
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SwipeableButtonView(
                            buttonText: 'Weight Confirmation',
                            buttonWidget: Container(
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            activeColor:
                                const Color.fromARGB(255, 247, 172, 12),
                            isFinished: isFinished,
                            onWaitingProcess: () {
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  isFinished = true;
                                });
                              });
                            },
                            onFinish: () async {
                              await Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const NavigatorPages()));
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
                      ])
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
