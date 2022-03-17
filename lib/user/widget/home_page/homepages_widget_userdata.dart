import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/widget/home_page/homepages_widget_article.dart';
import 'package:junkbee_user/beever/views/signin/sign_in.dart';

final format = NumberFormat.simpleCurrency(locale: 'id_ID');

class UserDataHomepages extends StatelessWidget {
  const UserDataHomepages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 30,
            color: Colors.amberAccent,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/background_home_page.png'), fit: BoxFit.cover)),
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInDriver())),
                      child: Text('Be a Beever', style: bodyBoldBody.copyWith(color: Colors.white)
                      )
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: ApiCallsGetData().getUserData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          var userdata = snapshot.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Hi,', style: bodyBodyUser),
                              Text('${userdata?.data.fullName}', style: bodyBodyUser),
                              const SizedBox(width: 30),
                              Row(
                                children: [
                                  Image.asset('assets/dompet.png', height: 20),
                                  const SizedBox(width: 10),
                                  Text('${format.format(int.parse(userdata?.data.balance))}', style: bodyBodyUser)
                                ],
                              )
                            ],
                          );
                        } else {
                          return const Center(child: SpinKitWave(size: 50, color: mainColor0));
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ),
          const ArticleJunkbee()
        ],
      ),
    );
  }
}

class UIHomePage extends StatelessWidget {
  final String? device_info;
  const UIHomePage({Key? key, required this.device_info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 30,
            color: Colors.amberAccent,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/background_home_page.png'), fit: BoxFit.cover)),
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInDriver())),
                      child: Text('Be a Beever', style: bodyBoldBody.copyWith(color: Colors.white)
                      )
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hi,', style: bodyBodyUser),
                        Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 9),
                          child: Text('$device_info', style: bodyBodyUser)
                        ),
                        const SizedBox(width: 30),
                        Row(
                          children: [
                            Image.asset('assets/dompet.png', height: MediaQuery.of(context).size.height / 25),
                            const SizedBox(width: 10),
                            Text('${format.format(int.parse('0'))}', style: bodyBodyUser)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          const ArticleJunkbee()
        ],
      ),
    );
  }
}