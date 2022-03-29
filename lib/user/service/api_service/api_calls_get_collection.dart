// ignore_for_file: avoid_print

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/models/collection_data_models.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';

final SecureStorage secureStorage = SecureStorage();

class GetCollectionData {
  Future<CollectionData> getCollectionData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final collectionData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getCollectionData),
        headers: {'Authorization': 'Bearer $token'});
    print(collectionData.body);

    return collectionDataFromJson(collectionData.body);
  }
}
