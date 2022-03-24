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
      transform: Matrix4.translationValues(0, -25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: defaultPadding6,
            child: Text('News', style: titleBodyMini),
          ),
          Padding(
            padding: defaultPadding0,
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
                                  final launchNews = EndPoint.finalNewsData + news?.data[index].slug;
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => News(url: launchNews)));
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: AspectRatio(
                                                aspectRatio: 16 / 9,
                                                child: Image.network(
                                                  EndPoint.bannerForNews + '${news?.data[index].banner}', fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
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
                      return const Center(child: SpinKitWave(size: 30, color: Colors.amber));
                    }
                  },
                )),
          ),
        ],
      )
    );
  }
}
