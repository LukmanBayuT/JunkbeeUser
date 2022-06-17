// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/location_tracking.dart';

class ConfirmationOrderScreen extends StatefulWidget {
  ConfirmationOrderScreen({Key? key, required String this.orderCode})
      : super(key: key);

  String? orderCode;

  @override
  State<ConfirmationOrderScreen> createState() =>
      _ConfirmationOrderScreenState();
}

class _ConfirmationOrderScreenState extends State<ConfirmationOrderScreen> {
  late double longBeever, latBeever;

  @override
  void initState() {
    ApiCallsGetCollectionDetails()
        .getCollectionData(widget.orderCode.toString());
    getLocation();
    super.initState();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latBeever = position.latitude;
      longBeever = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 7,
            color: Colors.amber,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          FutureBuilder(
            future: ApiCallsGetCollectionDetails()
                .getCollectionData(widget.orderCode.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var details = snapshot.data.data[0];
                var detailsWaste = snapshot.data.data[0].detail[0];
                var latUser = double.tryParse(details.lat);
                var longUser = double.tryParse(details.lng);
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Card(
                    shape: roundedRectBor,
                    child: Column(
                      children: [
                        const Text(
                          'Collection Details',
                          style: titleBody,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Collection Details for :'),
                            Text(details.orderCode),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Nama Pemesan',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      details.fullName,
                                      style: titleBoldMini,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Nama Tempat',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      details.tempat,
                                      style: titleBoldMini,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Alamat',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      details.location1,
                                      style: titleBoldMini,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Nomer Telp',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  Text(
                                    details.phone,
                                    style: titleBoldMini,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Waste Details',
                          style: titleBody,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Waste Details for :'),
                            Text(details.orderCode),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Jenis Sampah',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  Text(
                                    detailsWaste.wasteType,
                                    style: titleBoldMini,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Berat Sampah',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  Text(
                                    detailsWaste.wasteWeight,
                                    style: titleBoldMini,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      'Subtotal',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    child: const Text(
                                      ':',
                                      style: titleBoldMini,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${detailsWaste.subtotal}',
                                    style: titleBoldMini,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: roundedRectBor),
                                        onPressed: () {
                                          // Get.to(
                                          //   () => OngoingOrderProceed(
                                          //     latUser: latUser!.toDouble(),
                                          //     longUser: longUser!.toDouble(),
                                          //     userOrder: details.fullName,
                                          //     orderCode: details.orderCode,
                                          //     namaTempat: details.tempat,
                                          //     alamat: details.location1,
                                          //     latBeever: latBeever,
                                          //     longBeever: longBeever,
                                          //   ),
                                          // );
                                          Get.to(() => LocationTracking(
                                                latUser: latUser!.toDouble(),
                                                longUser: longUser!.toDouble(),
                                              ));
                                        },
                                        child: const Text(
                                          'Process',
                                          style: onboardingGetStarted,
                                        )),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Flexible(flex: 1, child: Container()),
          Flexible(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
