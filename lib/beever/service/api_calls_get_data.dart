// ignore_for_file: avoid_print
import 'package:junkbee_user/beever/model/collection_model.dart';
import 'package:junkbee_user/beever/model/collection_model_details.dart';
import 'package:junkbee_user/beever/model/news_model.dart';
import 'package:junkbee_user/beever/model/user_profile.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/constant/base_url.dart';

final SecureStorage secureStorage = SecureStorage();

class ApiCallsGetDataBeever {
  Future<BeeverData> getData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final driverData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});

    return beeverDataFromJson(driverData.body);
  }
}

class ApiCallsGetCollection {
  Future<CollectionModelBeever> getCollectionData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final driverCollectionData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.beeverGetCollection),
        headers: {'Authorization': 'Bearer $token'});
    print(driverCollectionData.body);

    return collectionModelBeeverFromJson(driverCollectionData.body);
  }
}

class ApiCallsGetCollectionDetails {
  Future<CollectionModelDetails> getCollectionData(String orderCode) async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final collectionModelDetails = await http.get(
        Uri.parse(
            EndPoint.baseApiURL + EndPoint.beeverCollectionDetails + orderCode),
        headers: {'Authorization': 'Bearer $token'});
    print(collectionModelDetails.body);

    return collectionModelDetailsFromJson(collectionModelDetails.body);
  }
}

class ApiCallsGetNews {
  Future<NewsData> getNews() async {
    final newsData = await http.get(
      Uri.parse(EndPoint.baseApiURL + EndPoint.getNewsData),
    );
    return newsDataFromJson(newsData.body);
  }
}
