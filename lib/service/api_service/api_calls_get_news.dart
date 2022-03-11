import 'package:junkbee_user/constant/base_url.dart';
import 'package:junkbee_user/models/news_model.dart';
import 'package:http/http.dart' as http;

class ApiCallsGetNews {
  Future<NewsData> getNews() async {
    final newsData = await http.get(
      Uri.parse(EndPoint.baseApiURL + EndPoint.getNewsData),
    );
    return newsDataFromJson(newsData.body);
  }
}
