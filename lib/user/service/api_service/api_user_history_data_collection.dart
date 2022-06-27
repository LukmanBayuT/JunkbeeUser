// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/models/collection_data_models.dart';
import 'package:junkbee_user/user/models/user_collection_models.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';

final SecureStorage secureStorage = SecureStorage();

class GetCollectionData {
  Future<UserActiveDataCollection> getUserActiveDataCollection() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse(EndPoint.baseApiURL + EndPoint.userColDatActive);

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (kDebugMode) {
        print(resBody);
      }
    } else {
      if (kDebugMode) {
        print(res.reasonPhrase);
      }
    }
    return userActiveDataCollectionFromJson(resBody);
  }

  Future<UserHistoryDataCollection> getCollectionDataHistory() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final collectionData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getCollectionData),
        headers: {'Authorization': 'Bearer $token'});

    return userHistoryDataCollectionFromJson(collectionData.body);
  }
}
