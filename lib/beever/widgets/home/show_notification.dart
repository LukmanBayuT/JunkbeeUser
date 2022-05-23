import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowNotification {
  void showFlushBar(BuildContext context) {
    Flushbar(
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
}
