import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/models/waste_price_models.dart';

import '../../constant/base_url.dart';
import '../../models/user_data_models.dart';
import '../storage/secure_storage.dart';

final SecureStorage secureStorage = SecureStorage();

class ApiCallsGetDataUser {
  Future<UserData> getUserData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final userData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});

    return userDataFromJson(userData.body);
  }

  Future<WastePrice> getWastePrice() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse('https://staging2.junkbee.id/api/public/waste');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    final resBodyData = jsonDecode(resBody);
    var paperPrice = resBodyData['data'][0]['price'];
    secureStorage.writeSecureData('paperPrice', paperPrice);
    var paper = await secureStorage.readSecureData('paperPrice');

    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (kDebugMode) {
        print(paperPrice);
        print(paper);
      }
    } else {
      if (kDebugMode) {
        print(res.reasonPhrase);
      }
    }
    return wastePriceFromJson(resBody);
  }
}
