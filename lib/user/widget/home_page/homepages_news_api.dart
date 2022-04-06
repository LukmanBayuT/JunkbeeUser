import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_news.dart';
import 'package:junkbee_user/user/view/pages/home_page/news.dart';

class NewsApiUsers extends StatelessWidget {
  const NewsApiUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width / 1.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('News', style: titleBodyMini),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 100),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 3.5,
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                News(url: launchNews)));
                                  },
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: AspectRatio(
                                                  aspectRatio: 11 / 10,
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
                                        const Padding(
                                            padding: EdgeInsets.only(top: 5)),
                                        Text(
                                          '${news?.data[index].judul}',
                                          style: bodySlimBody,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                            child: SpinKitWave(size: 30, color: Colors.amber));
                      }
                    },
                  )),
            ),
          ],
        ));
  }
}
