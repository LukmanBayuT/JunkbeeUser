import 'package:flutter/material.dart';
import 'package:junkbee_user/constant/constant.dart';
import 'package:junkbee_user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/widget/homepages_widget_article.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserDataHomepages extends StatelessWidget {
  const UserDataHomepages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            color: Colors.amberAccent,
          ),
          Positioned(
            top: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background_home_page.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 15,
            right: MediaQuery.of(context).size.width / 50,
            child: SizedBox(
              width: 150,
              height: 50,
              child: Text(
                'Be a Beever',
                style: bodyBoldBody.copyWith(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              child: FutureBuilder(
                future: ApiCallsGetData().getUserData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var userdata = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi,',
                          style: bodyBodyUser,
                        ),
                        Text(
                          '${userdata?.data.fullName}',
                          style: titleBodyUser,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/dompet.png',
                              height: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Rp.',
                              style: bodyBoldBody.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${userdata?.data.balance}',
                              style: bodyBodyUser,
                            )
                          ],
                        )
                      ],
                    );
                  } else {
                    return const Center(
                      child: SpinKitWave(
                        size: 50,
                        color: mainColor0,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          const ArticleJunkbee()
        ],
      ),
    );
  }
}
