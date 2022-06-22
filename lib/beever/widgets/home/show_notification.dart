// ignore_for_file: avoid_print

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/beever/views/pages/ongoing_order/ongoing_order.dart';

class ShowNotification {
  void showFlushBar(BuildContext context) {
    Flushbar(
      onTap: ((flushbar) {
        Get.to(() => const OngoingOrder());
      }),
      onStatusChanged: (status) {
        print('Dipencet');
      },
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: ButtonBar(
        children: [
          IconButton(
            onPressed: () {
              print("You clicked me!");
            },
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Colors.amber,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      title: "Beever ada Pesanan!",
      titleColor: Colors.grey,
      message: "Silahkan check pada Collection List",
      messageColor: Colors.grey,
      messageSize: 17,
      duration: const Duration(seconds: 4),
    ).show(context);
  }

  void showErrorSignUp(BuildContext context) {
    Flushbar(
      onTap: ((flushbar) {}),
      onStatusChanged: (status) {
        print('Dipencet');
      },
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: ButtonBar(
        children: [
          IconButton(
            onPressed: () {
              print("You clicked me!");
            },
            icon: const Icon(
              Icons.close,
              color: Colors.amber,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      title: "Gagal!",
      titleColor: Colors.amber,
      message: "Silahkan lengkapi form dengan benar",
      messageColor: Colors.amber,
      messageSize: 17,
      duration: const Duration(seconds: 4),
    ).show(context);
  }
}
