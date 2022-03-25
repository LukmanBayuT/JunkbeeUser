import 'package:flutter/material.dart';
import 'package:junkbee_user/user/view/pages/order_process/testing_search.dart';
import 'package:junkbee_user/user/view/pages/order_process/widget1.dart';
import 'package:junkbee_user/user/view/pages/order_process/widget2.dart';

class TestingMap extends StatefulWidget {
  @override
  _TestingMapState createState() => _TestingMapState();
}

class _TestingMapState extends State<TestingMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/images/uber.png', height: 70),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: ActionContainerLarge(
                    img: 'assets/images/suv.png',
                    title: 'Ride',
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ActionContainerLarge(
                      img: 'assets/images/box.png', title: 'Package'),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                  child: ActionContainerSmall(
                    img: 'assets/images/car.png',
                    title: 'Car',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ActionContainerSmall(
                    img: 'assets/images/train.png',
                    title: 'Train',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ActionContainerSmall(
                    img: 'assets/images/bus.png',
                    title: 'Bus',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ActionContainerSmall(
                    img: 'assets/images/car.png',
                    title: 'Transit',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                      fullscreenDialog: true),
                );
              },
              autofocus: false,
              showCursor: false,
              decoration: InputDecoration(
                  hintText: 'Where To?',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 24),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none),
            )
          ],
        ),
      ),
    );
  }
}
