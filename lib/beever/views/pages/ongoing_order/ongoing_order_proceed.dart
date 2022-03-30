import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OngoingOrderProceed extends StatefulWidget {
  var panelController = PanelController();

  OngoingOrderProceed({Key? key}) : super(key: key);

  @override
  State<OngoingOrderProceed> createState() => _OngoingOrderProceedState();
}

class _OngoingOrderProceedState extends State<OngoingOrderProceed> {
  final TextEditingController _jenisSampah = TextEditingController();
  final TextEditingController _BeratSampah = TextEditingController();
  final panelController = PanelController();
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

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
            GoogleMap(initialCameraPosition: initialCameraPosition),
            Column(
              children: [
                const SizedBox(
                  height: 100,
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
                        children: const [
                          Text(
                            'Collection By',
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
                            'Pickup Location',
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
                (isOnTheWay == true)
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6,
                                height: MediaQuery.of(context).size.height / 13,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      shape: roundedRectBor),
                                  child: const Text('Cancel',
                                      style: onboardingGetStarted),
                                  onPressed: () {
                                    Get.back();
                                  },
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6,
                                height: MediaQuery.of(context).size.height / 13,
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
                          ],
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
                                controller: _BeratSampah,
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
                                    onPressed: () {},
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
