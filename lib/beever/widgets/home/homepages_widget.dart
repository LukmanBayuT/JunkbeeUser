// ignore_for_file: unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/views/pages/home/withdraw.dart';
import 'package:junkbee_user/beever/views/pages/home/available_pickUp.dart';
import 'package:junkbee_user/beever/views/pages/home/current_pickUp.dart';
import 'package:junkbee_user/beever/views/pages/home/history_pickUp.dart';
import 'package:junkbee_user/beever/views/pages/home/news.dart';

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          GestureDetector(
            onTap: () {
              Get.offAll(() => const NavigatorUser());
            },
            child: Text('Be a User', style: titleBodyMini.copyWith(color: Colors.white))
          )
        ],
      ),
    );
  }
}

Container profileAndBalance(BuildContext context) {
  final format = NumberFormat.simpleCurrency(locale: 'id_ID');
  return Container(
    transform: Matrix4.translationValues(0, -70, 0),
    width: MediaQuery.of(context).size.width / 1.1,
    child: FutureBuilder(
      future: ApiCallsGetData().getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var beever = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Column(
              children: [
                // Image.asset('assets/beever_image.png',
                //     width: MediaQuery.of(context).size.width / 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: beever?.data.image == null
                      ? Image.asset('assets/beever_image.png',
                          height: MediaQuery.of(context).size.height / 8)
                      : Image.network(
                          '${EndPoint.baseURL}storage/profile-images/${beever?.data.image}',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                ),
                Text('${beever?.data.fullName}', style: titleBodyMini),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: defaultPadding2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/star_icon.png', height: 30),
                          const Text('(4.5)', style: signScreenTextStyle)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: Card(
                    shape: roundedRectBor,
                    child: Column(
                      children: [
                        Padding(
                          padding: defaultPadding2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Balance', style: textProfileBold),
                              Text(
                                  '${format.format(int.parse(beever?.data.balance))}',
                                  style: textProfileBold),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TouchableOpacity(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WithdrawScreen())),
                              child: Column(
                                children: [
                                  Image.asset('assets/withdraw_icon.png', height: MediaQuery.of(context).size.height / 25),
                                  const SizedBox(height: 5),
                                  const Text('Withdraw', style: bodySlimBody),
                                ],
                              ),
                            ),
                            TouchableOpacity(
                              child: Column(
                                children: [
                                  Image.asset('assets/topup_icon.png', height: MediaQuery.of(context).size.height / 25),
                                  const SizedBox(height: 5),
                                  const Text('Topup', style: bodySlimBody),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: SpinKitWave(color: Colors.amberAccent, size: 50));
        }
      },
    ),
  );
}

Container orderPickup(BuildContext context) {
  return Container(
    transform: Matrix4.translationValues(0, -40, 0),
    width: MediaQuery.of(context).size.width / 1.1,
    padding: defaultPadding0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: defaultPadding8,
          child: Text('Order', style: textProfileBoldMed),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            availablePickUp(context),
            currentPickUp(context),
            pickUpHistory(context),
          ],
        )
      ],
    ),
  );
}

SizedBox pickUpHistory(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width / 3.45,
      child: TouchableOpacity(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HistoryScreen())),
        child: Card(
          shape: roundedRectBor,
          child: Column(
            children: [
              Padding(
                padding: defaultPadding0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('0', style: titleBodyMini),
                    Image.asset('assets/arrow_forward.png',
                        width: MediaQuery.of(context).size.width / 40)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text('Picked Up History', style: bodySlimBody),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 7.5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(20)),
                  ))
            ],
          ),
        ),
      ));
}

SizedBox currentPickUp(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width / 3.45,
      child: TouchableOpacity(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CurrentScreen())),
        child: Card(
          shape: roundedRectBor,
          child: Column(
            children: [
              Padding(
                padding: defaultPadding0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('0', style: titleBodyMini),
                    Image.asset('assets/arrow_forward.png',
                        width: MediaQuery.of(context).size.width / 40)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text('Current Pick Up', style: bodySlimBody),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 7.5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)),
                  ))
            ],
          ),
        ),
      ));
}

SizedBox availablePickUp(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width / 3.45,
      child: TouchableOpacity(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AvailableScreen())),
        child: Card(
          shape: roundedRectBor,
          child: Column(
            children: [
              Padding(
                padding: defaultPadding0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('0', style: titleBodyMini),
                    Image.asset('assets/arrow_forward.png',
                        width: MediaQuery.of(context).size.width / 40)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text('Available Pick Up', style: bodySlimBody),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 7.5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(20)),
                  ))
            ],
          ),
        ),
      ));
}

class NewsAPI extends StatelessWidget {
  const NewsAPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: defaultPadding6,
            child: Text('News for you', style: textProfileBoldMed),
          ),
          Padding(
            padding: defaultPadding0,
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 3,
                child: FutureBuilder(
                  future: ApiCallsGetNews().getNews(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var news = snapshot.data;

                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: news.data.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: defaultPaddingHorizontal,
                              child: GestureDetector(
                                onTap: () async {
                                  final launchNews = EndPoint.finalNewsData +
                                      news?.data[index].slug;
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        NewsScreen(url: launchNews),
                                  ));
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: AspectRatio(
                                                aspectRatio: 15 / 10,
                                                child: Image.network(
                                                  EndPoint.bannerForNews +
                                                      '${news?.data[index].banner}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text('${news?.data[index].judul}',
                                          style: bodySlimBody,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                          child: SpinKitWave(
                        color: Colors.amberAccent,
                        size: 50,
                      ));
                    }
                  },
                )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      )
    );
  }
}
