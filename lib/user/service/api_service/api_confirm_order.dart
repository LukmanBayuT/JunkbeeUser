import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../beever/service/secure_storage.dart';

class ApiUser {
  SecureStorage secureStorage = SecureStorage();

  Future userConfirmOrder(String orderCode) async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse(
        'https://staging2.junkbee.id/api/userdata/collection/accept?order_code=$orderCode');

    var req = http.Request('PUT', url);
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
  }
}
