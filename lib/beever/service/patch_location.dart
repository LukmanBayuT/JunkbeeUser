import 'package:geolocator/geolocator.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:http/http.dart' as http;

class PatchLocation {
  SecureStorage secureStorage = SecureStorage();
  Future<void> patchBeeverLocation() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    var id = await secureStorage.readSecureData('id');
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    var uri = Uri.https(
        'www.staging2.junkbee.id', '/api/beever/update/location', {
      'id': id,
      'lat': lat.toString(),
      'lng': long.toString(),
      'status': 'ready'
    });
    var response =
        await http.patch(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return Future.delayed(const Duration(seconds: 5))
          .then((value) => patchBeeverLocation());
    } else {}
  }
}
