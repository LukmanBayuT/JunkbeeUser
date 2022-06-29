import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:junkbee_user/beever/model/beever_status.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/beever/model/user_profile.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';

class ApiServiceStatusBeever {
  final SecureStorage secureStorage = SecureStorage();
  Future<BeeverData> getDataBeever() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMSIsImp0aSI6ImVkNTc0MWU4MjJlOTM2ZDg3NzZlZDk4NGIwNjZlOTYxYTQzZDU4MWFiMWMzNjUxZjNhNzQ1ZTE2ZDBhMWNmYTgxYThhODA1MDIxYWE5YzBiIiwiaWF0IjoxNjU2NDc2ODEzLjM4Njk3LCJuYmYiOjE2NTY0NzY4MTMuMzg2OTgsImV4cCI6MTY4ODAxMjgxMy4zODI0MzUsInN1YiI6IjE5Iiwic2NvcGVzIjpbXX0.P4tlPLuP6xBeXLnuyezPuKzhzCY30CI0fw-D3n0v_w1gXN-67Wrt00TDVFPn8u76uUvQSNZxZmTKvgfOl6KqyCUPunKwEjdfMk07bLEaTnwbdZXcEFtrdVGyk4_Y37O4B1_ZyeLRAwg_dY3pD8do16Uu9_ozdsjEvL4d1BI1jYWw73OC6R4KCKqAjjDPsg4hZ3UxxREvlymwh5pyFXpb-Q_7wWc_o8Yvazb2VQYrFPL_PxO81lGZ0rHNQq4l-93RqwnAy9grqFDVZyRU94IrT888zdYl2TZuT93YHB_VxHy5K1lji-CIEUl85d0430Y5d2LbthAe5fge2wu7Qdn4PD8vEIoYfuJPDz8NRqgkHlFFE7leCXOb_d1vitaVwN6zpyF3WRh1uNpucYIf1UvJYI35sEgwlR2Hp9n8oXxnqaASraJGKgTZLNA2QEQmD0coQSjfgzcFRbJziNO87Zn58EHi6jIuICfCW165LhOgEOxnjwWovED6R7CAOJmS96FZ6oBVx0pxrOmV2hsWjIJvX10GucdgBo7mqs3rCQ_SlJO-c54BLm7giOZfS55mvzb-xUAjnWukX_FMVAXKfipRqEEsVhw-oOAt6_-HllSybzN-Cg4x3yBJZIjpVRAr22MNEQKkIOCyemZBMWqVYiqTBj_U-aeBECO1JuLftesFfVU'
    };
    var url = Uri.parse('https://staging2.junkbee.id/api/userdata/get');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      var jsonData = jsonDecode(resBody);
      var jsonDataStatus = jsonData['data']['active'];
      try {
        if (jsonDataStatus == '1') {
          print('active boss');
        }
      } catch (e) {
        print('i got nothing');
      }
    } else {
      print(res.reasonPhrase);
    }
    return beeverDataFromJson(resBody);
  }

  Future<BeeverStatus> patchStatusReady() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse(
        'https://staging2.junkbee.id/api/beever/update/status?status=ready');

    var req = http.Request('PATCH', url);
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
    return beeverStatusFromJson(resBody);
  }
}
