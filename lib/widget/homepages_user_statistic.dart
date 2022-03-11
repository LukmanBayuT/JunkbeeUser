import 'package:flutter/material.dart';
import 'package:junkbee_user/constant/constant.dart';

class StatisticUsers extends StatelessWidget {
  const StatisticUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistic',
            style: titleBody,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                    borderRadius: roundedRect,
                    border: Border.all(color: Colors.amber, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '4.500',
                        style: titleBodyStatistic,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Material\nRecycled',
                        style: bodyBody,
                      ),
                    ),
                    Container(
                        width: 130,
                        height: 15,
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)))),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                    borderRadius: roundedRect,
                    border: Border.all(color: Colors.amber, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '1.000',
                        style: titleBodyStatistic,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Trees\nSaved',
                        style: bodyBody,
                      ),
                    ),
                    Container(
                        width: 130,
                        height: 15,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)))),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                    borderRadius: roundedRect,
                    border: Border.all(color: Colors.amber, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '1.200',
                        style: titleBodyStatistic,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Collection\nMade',
                        style: bodyBody,
                      ),
                    ),
                    Container(
                        width: 130,
                        height: 15,
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
