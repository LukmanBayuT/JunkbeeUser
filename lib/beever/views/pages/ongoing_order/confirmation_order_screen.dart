// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';

class ConfirmationOrderScreen extends StatefulWidget {
  ConfirmationOrderScreen({Key? key, required String this.orderCode})
      : super(key: key);

  String? orderCode;

  @override
  State<ConfirmationOrderScreen> createState() =>
      _ConfirmationOrderScreenState();
}

class _ConfirmationOrderScreenState extends State<ConfirmationOrderScreen> {
  @override
  void initState() {
    ApiCallsGetCollectionDetails()
        .getCollectionData(widget.orderCode.toString());
    super.initState();
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
                return Flexible(
                    flex: 6,
                    child: SizedBox(
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
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'ID',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
                                        child: const Text(
                                          ':',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      Text(
                                        details.userId,
                                        style: titleBoldMini,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Nama Pemesan',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
                                        child: const Text(
                                          ':',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      Text(
                                        details.fullName,
                                        style: titleBoldMini,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Nama Tempat',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
                                        child: const Text(
                                          ':',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      Text(
                                        details.tempat,
                                        style: titleBoldMini,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Alamat',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
                                        child: const Text(
                                          ':',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      Text(
                                        details.location1,
                                        style: titleBoldMini,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Nomer Telp',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
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
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Jenis Sampah',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
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
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Berat Sampah',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
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
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Text(
                                          'Subtotal',
                                          style: titleBoldMini,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
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
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
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