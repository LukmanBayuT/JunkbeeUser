import 'package:junkbee_user/beever/model/beever_confirmation.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/constant/base_url.dart';

class BeeverApi {
  SecureStorage secureStorage = SecureStorage();

  Future<BeeverConfirmation> beeverConfirm(
      String orderCode, totalWeight, total, wasteType) async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final beeverConfirmCollection = await http.post(
        Uri.parse(EndPoint.baseApiURL + EndPoint.beeverConfirmation),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          'order_code': orderCode,
          'waste_weight': totalWeight,
          'total_weight': totalWeight,
          'subtotal': total,
          'total': total,
          'fee_beever': '3000',
          'waste_type': wasteType
        });
    print(beeverConfirmCollection.body);
    return beeverConfirmationFromJson(beeverConfirmCollection.body);
  }
}
