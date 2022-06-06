// ignore_for_file: file_names, library_private_types_in_public_api, use_full_hex_values_for_flutter_colors, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'topup_confirmation.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  final SecureStorage secureStorage = SecureStorage();
  List bank = [
    {'id': 1, 'bank_name': 'BCA', 'image': 'assets/bank_central_asia.png'},
    {'id': 2, 'bank_name': 'BRI', 'image': 'assets/group_1739.png'},
    {'id': 3, 'bank_name': 'Mandiri', 'image': 'assets/bank_mandiri.png'},
    {'id': 4, 'bank_name': 'BNI', 'image': 'assets/layer_3.png'}
  ];
  bool loading = false;
  TextEditingController amount = TextEditingController();
  String payment_method = '';
  String image = '';

  _onWillPop() async {
    Navigator.pop(context, 'back');
  }

  void topUp() async {
    if (payment_method == 'BCA' ||
        payment_method == 'BRI' ||
        payment_method == 'BNI') {
      setState(() => loading = true);
      var authToken = await secureStorage.readSecureData('token');
      var token = authToken;

      final top_up = await http.post(
          Uri.parse(EndPoint.baseApiURL + EndPoint.topUp),
          headers: {'Authorization': 'Bearer $token'},
          body: {'amount': amount.text.trim(), 'bank': payment_method});
      Map<String, dynamic> bodyJson = jsonDecode(top_up.body);
      var va_numbers = jsonEncode(bodyJson['data']['va_numbers']);
      String x1 = va_numbers;
      var x2 = jsonDecode(x1);
      List? list = x2 != null ? List.from(x2) : null;
      if (bodyJson['message'] == 'data has been updated') {
        setState(() => loading = false);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TopupConfirmation(
                amount: amount.text,
                image: image,
                bank_name: list![0]['bank'],
                va_number: list[0]['va_number'],
                id_transaksi: bodyJson['data']['transaction_id'])));
      }
    } else if (payment_method == 'Mandiri') {
      setState(() => loading = true);
      var authToken = await secureStorage.readSecureData('token');
      var token = authToken;

      final top_up = await http.post(
          Uri.parse(EndPoint.baseApiURL + EndPoint.topUp),
          headers: {'Authorization': 'Bearer $token'},
          body: {'amount': amount.text.trim(), 'bank': payment_method});
      Map<String, dynamic> bodyJson = jsonDecode(top_up.body);
      if (bodyJson['message'] == 'data has been updated') {
        setState(() => loading = false);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TopupConfirmation(
                amount: amount.text,
                image: image,
                bank_name: 'mandiri',
                va_number: bodyJson['data']['permata_va_number'],
                id_transaksi: bodyJson['data']['transaction_id'])));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xFFF8C503),
                title: const Text('Top Up', style: textBodyProfile),
                centerTitle: true,
                leading: GestureDetector(
                    onTap: () => Navigator.pop(context, 'back'),
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white))),
            body: Stack(alignment: Alignment.topCenter, children: [
              Column(children: [
                SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 25, left: 25, right: 25, bottom: 15),
                          child:
                              const Text('Top Up Trough', style: bodySlimBody)),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 20),
                          child: TextFormField(
                              controller: amount,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Input Nominal',
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color(0xFF707070)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.7),
                                      borderSide: const BorderSide(
                                          color: Colors.black45, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.7),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFF8C503),
                                          width: 2.0))))),
                      Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                  title: const Text('Transfer Bank',
                                      style: textProfileBold),
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: bank.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        payment_method =
                                                            bank[index]
                                                                ['bank_name'];
                                                        image = bank[index]
                                                            ['image'];
                                                      });
                                                    },
                                                    child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                right: 20,
                                                                bottom: 20),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 5),
                                                              child: payment_method ==
                                                                      bank[index]
                                                                          [
                                                                          'bank_name']
                                                                  ? Image.asset(
                                                                      'assets/group_2201.png',
                                                                      width: 20)
                                                                  : Container(
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              width:
                                                                                  1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20)))),
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                      left: 5),
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFFFFDF5),
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: const Color(
                                                                          0xFF40F8C503))),
                                                              width: 80,
                                                              height: 35,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Image.asset(
                                                                  bank[index]
                                                                      ['image'],
                                                                  height: 20)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                        'Bank ${bank[index]['bank_name']} (Dicek Otomatis)',
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w800,
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Color(0xFF707070))),
                                                                    Text(
                                                                        'Hanya menerima dari ${bank[index]['bank_name']}',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Color(0xFF707070)))
                                                                  ]))
                                                        ])))
                                              ]);
                                        })
                                  ])))
                    ]))
              ]),
              Positioned(
                  bottom: 50,
                  child: Container(
                      width: 350,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () => topUp(),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              primary: const Color(0xFFF8C503)),
                          child: const Text('Continue',
                              style: textProfileBoldWhiteMedium)))),
              (loading)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      alignment: Alignment.center,
                      child: const SpinKitCircle(
                          color: Color(0xFFF8C503), size: 100))
                  : Container()
            ])));
  }
}
