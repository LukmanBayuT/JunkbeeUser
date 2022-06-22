import 'dart:async';

import 'package:http/http.dart' as http;

import '../../constant/base_url.dart';
import '../../models/user_data_models.dart';
import '../storage/secure_storage.dart';

final SecureStorage secureStorage = SecureStorage();

class ApiCallsGetData {
  Future<UserData> getUserData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final userData = await http.get(
        Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
        headers: {'Authorization': 'Bearer $token'});

    return userDataFromJson(userData.body);
  }
}
