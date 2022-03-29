import 'package:flutter/material.dart';

class UserOrderAfterProcessed extends StatefulWidget {
  const UserOrderAfterProcessed({Key? key}) : super(key: key);

  @override
  State<UserOrderAfterProcessed> createState() =>
      _UserOrderAfterProcessedState();
}

class _UserOrderAfterProcessedState extends State<UserOrderAfterProcessed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(),
      ),
    );
  }
}
