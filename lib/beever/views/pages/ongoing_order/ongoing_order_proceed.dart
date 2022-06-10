// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:junkbee_user/user/constant/constant.dart';

import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OngoingOrderProceed extends StatefulWidget {
  var panelController = PanelController();

  double latUser;
  double longUser;
  var alamat;
  var namaTempat;
  var userOrder;
  var orderCode;

  OngoingOrderProceed(
      {Key? key,
      required this.latUser,
      required this.longUser,
      required this.userOrder,
      required this.namaTempat,
      required this.alamat,
      required this.orderCode})
      : super(key: key);

  @override
  State<OngoingOrderProceed> createState() => _OngoingOrderProceedState();
}

class _OngoingOrderProceedState extends State<OngoingOrderProceed> {
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }

  final TextEditingController _jenisSampah = TextEditingController();
  final TextEditingController _beratSampah = TextEditingController();
  final panelController = PanelController();

  bool isOnTheWay = true;
  bool isOnTheWayText = false;
  bool isOnPickUp = false;
  bool isOnPickUpText = false;
  bool isWeightConfirmation = false;
  bool isWeightConfirmationText = false;
  bool isLastScreen = false;
  bool isLastScreenText = false;
  bool isCompleted = false;
  bool isFinished = false;

  late double latUser = widget.latUser;
  late double longUser = widget.longUser;

  late LatLng userLocation = LatLng(latUser, longUser);

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
              markers: {
                Marker(
                  markerId: MarkerId('${widget.userOrder}'),
                  position:
                      LatLng(userLocation.latitude, userLocation.longitude),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueOrange),
                ),
              },
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
                            widget.userOrder ?? 'Nama User',
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
                                widget.namaTempat ?? 'Nama Tempat',
                                style: bodyBodyBold,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: Text(
                                  widget.alamat ?? 'Alamat',
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
                const Divider(
                  height: 20,
                  thickness: 5,
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
                            Future.delayed(const Duration(seconds: 3), () {
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
}
