// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/models/geocoding_model.dart';

class GetLocationGeocoding {
  Future<GeocodingModel> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude.toString();
    var long = position.longitude.toString();

    String url =
        // ignore: unnecessary_brace_in_string_interps
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${long}&key=AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k';

    var response = await http.post(Uri.parse(url));

    print(url);

    return geocodingModelFromJson(response.body);
  }

  // Future<GeocodingModel> getGeocodeLocation() async {
  //   var response = await http.get(Uri.parse(
  //       'https://maps.googleapis.com/maps/api/geocode/json?latlng=-6.9714229,%20110.4265293&key=AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k'));

  //   print(response.body);

  //   return geocodingModelFromJson(response.body);
  // }
}
