import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/model/news_model.dart';
import 'package:junkbee_user/beever/model/user_profile.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:http/http.dart' as http;

final SecureStorage secureStorage = SecureStorage();

class ApiCallsGetData {
  Future<BeeverData> getData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final driverData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});
    print(driverData.body);

    return beeverDataFromJson(driverData.body);
  }
}

class ApiCallsGetOnGoing {}

class ApiCallsGetNews {
  Future<NewsData> getNews() async {
    final newsData = await http.get(
      Uri.parse(EndPoint.baseApiURL + EndPoint.getNewsData),
    );
    return newsDataFromJson(newsData.body);
  }
}
