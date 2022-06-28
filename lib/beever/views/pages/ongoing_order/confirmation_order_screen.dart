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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 10,
              color: Colors.amber,
            ),
            SizedBox(
              height: Get.height / 20,
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
                    width: Get.width / 1.1,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 4,
                                      child: const Text(
                                        'Nama Pemesan',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
                                      child: const Text(
                                        ':',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 2,
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
                                      width: Get.width / 4,
                                      child: const Text(
                                        'Nama Tempat',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
                                      child: const Text(
                                        ':',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 2,
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
                                      width: Get.width / 4,
                                      child: const Text(
                                        'Alamat',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
                                      child: const Text(
                                        ':',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        details.location1,
                                        style: titleBoldMini,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 4,
                                      child: const Text(
                                        'Nomer Telepon',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
                                      child: const Text(
                                        ':',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        details.phone,
                                        style: titleBoldMini,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 4,
                                      child: const Text(
                                        'Notes',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
                                      child: const Text(
                                        ':',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        details.notes,
                                        style: titleBoldMini,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Waste Details',
                            style: titleBody,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 3,
                                      child: const Text(
                                        'Jenis Sampah',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
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
                                      width: Get.width / 3,
                                      child: const Text(
                                        'Berat Sampah',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
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
                                      width: Get.width / 3,
                                      child: const Text(
                                        'Subtotal',
                                        style: titleBoldMini,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 12,
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
                                      width: Get.width / 1.2,
                                      height: Get.height / 15,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: roundedRectBor),
                                          onPressed: () {
                                            Get.to(() => LocationTracking(
                                                  latUser: latUser!.toDouble(),
                                                  longUser:
                                                      longUser!.toDouble(),
                                                  userOrder: details.fullName,
                                                  orderCode: details.orderCode,
                                                  namaTempat: details.tempat,
                                                  alamat: details.location1,
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
          ],
        ),
      ),
    );
  }
}
