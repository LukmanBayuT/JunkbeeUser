import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/ongoing_order_proceed_final.dart';
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
  final panelController = PanelController();
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  bool isOnTheWay = true;
  bool isOnPickUp = false;
  bool isWeightConfirmation = false;
  bool isCollectionPoint = false;
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

    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        parallaxEnabled: true,
        parallaxOffset: .5,
        borderRadius: roundedRect,
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpen,
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
                            Text(
                              'On The Way',
                              style: onboardingGetStarted.copyWith(
                                  color: const Color(0xFF707070), fontSize: 15),
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
                              'Pick Up Point',
                              style: onboardingGetStarted.copyWith(
                                  color: const Color(0xFF707070), fontSize: 15),
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
                              style: onboardingGetStarted.copyWith(
                                  color: const Color(0xFF707070), fontSize: 15),
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
                              style: onboardingGetStarted.copyWith(
                                  color: const Color(0xFF707070), fontSize: 15),
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
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                isFinished = true;
                              });
                            });
                          },
                          onFinish: () async {
                            await Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: OngoingOrderProceedFinal()));
                            setState(() {
                              isFinished = false;
                              isOnPickUp = false;
                              isOnTheWay = true;
                            });
                          },
                        ),
                      )
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
