// ignore_for_file: use_full_hex_values_for_flutter_colors, library_private_types_in_public_api, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';

class TopupConfirmation extends StatefulWidget {
  String amount;
  String image;
  String bank_name;
  String va_number;
  String id_transaksi;
  TopupConfirmation(
      {Key? key,
      required this.image,
      required this.amount,
      required this.bank_name,
      required this.va_number,
      required this.id_transaksi})
      : super(key: key);

  @override
  _TopupConfirmationState createState() => _TopupConfirmationState();
}

class _TopupConfirmationState extends State<TopupConfirmation> {
  final format = NumberFormat.simpleCurrency(locale: 'id_ID');
  final SecureStorage secureStorage = SecureStorage();
  bool loading = false;

  void cancelProsesTopUp() async {
    setState(() => loading = true);
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final cancel_proses = await http.post(
        Uri.parse(EndPoint.baseApiURL + EndPoint.cancel_topup),
        headers: {'Authorization': 'Bearer $token'},
        body: {'transaction_id': widget.id_transaksi});
    Map<String, dynamic> bodyJson = jsonDecode(cancel_proses.body);
    if (bodyJson['message'] == 'data has been updated') {
      setState(() => loading = false);
      Fluttertoast.showToast(
          msg: 'Anda sudah membatalkan proses Top Up Anda',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: const Color(0xFFF8C503));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFF8C503),
            title: const Text('Top Up', style: textBodyProfile),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white))),
        body: Stack(children: [
          SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 80,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Color(0xFF0D000000),
                        spreadRadius: 0.0,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Amount',
                            style: TextStyle(
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        Text(format.format(int.parse(widget.amount)),
                            style: const TextStyle(
                                color: Color(0xFFF30000),
                                fontWeight: FontWeight.w600,
                                fontSize: 16))
                      ])),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color(0xFF0D000000),
                    spreadRadius: 0.0,
                    blurRadius: 2,
                    offset: Offset(0, 1))
              ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            top: 30, left: 20, right: 25, bottom: 15),
                        child: Row(children: [
                          Image.asset(widget.image, width: 80, height: 20),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                  'Bank ${widget.bank_name.toUpperCase()} (Dicek Otomatis)',
                                  style: const TextStyle(
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w600)))
                        ])),
                    Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: const Divider(thickness: 1.0)),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 15, left: 25, right: 25, bottom: 15),
                        child: const Text('No. Rekening',
                            style: TextStyle(
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.w500))),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.va_number,
                                  style: const TextStyle(
                                      color: Color(0xFFF30000),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26)),
                              GestureDetector(
                                  onTap: () => print('salin'),
                                  child: const Text('SALIN',
                                      style: TextStyle(
                                          color: Color(0xFF88D1F0),
                                          fontWeight: FontWeight.w700)))
                            ])),
                    Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: const Divider(thickness: 1.0)),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 15, left: 25, right: 25, bottom: 25),
                        child: Text(
                            'Transfer pembayaran Top Up Anda melalui Virtual Account dari bank ${widget.bank_name.toUpperCase()}',
                            style: const TextStyle(
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.w500)))
                  ]),
            ),
            Container(
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () => print('OK'),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            primary: const Color(0xFFF8C503)),
                        child: const Text('OK',
                            style: textProfileBoldWhiteMedium)))),
            Container(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          showAnimatedDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    elevation: 1,
                                    backgroundColor: Colors.white,
                                    insetPadding: const EdgeInsets.all(0),
                                    child: Container(
                                        width: 380,
                                        height: 250,
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: 350,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(),
                                                            GestureDetector(
                                                                onTap: () =>
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(),
                                                                child: Image.asset(
                                                                    'assets/group_2210.png',
                                                                    width: 20))
                                                          ])),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 18,
                                                              bottom: 45),
                                                      child: const Text(
                                                          'Anda yakin ingin membatalkan proses Top Up Anda?',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18))),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () => Navigator
                                                                    .of(context)
                                                                .pop(),
                                                            child: Container(
                                                                width: 175,
                                                                height: 60,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: const Text(
                                                                    'Tidak',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF707070),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            20)))),
                                                        Container(
                                                            width: 175,
                                                            height: 60,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                10)),
                                                                        primary:
                                                                            const Color(
                                                                                0xFFF8C503)),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      cancelProsesTopUp();
                                                                    },
                                                                    child: const Text(
                                                                        'Ya',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w800,
                                                                            fontSize: 20))))
                                                      ]),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15))
                                                ]))));
                              },
                              animationType:
                                  DialogTransitionType.slideFromBottomFade,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(seconds: 1));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            primary: const Color(0xFFF30000)),
                        child: const Text('Cancel',
                            style: textProfileBoldWhiteMedium))))
          ])),
          (loading)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  alignment: Alignment.center,
                  child:
                      const SpinKitCircle(color: Color(0xFFF8C503), size: 100))
              : Container()
        ]));
  }
}
