import 'package:geolocator/geolocator.dart';
import 'package:junkbee_user/user/view/pages/order_process/request_assistant.dart';

class AssistantMethods {
  static Future<String?> searchCoordinateAddress(Position position) async {
    String? placeAddress = "";
    String? url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}=AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k';

    var response = await RequestAssistant.getRequest(url);

    if (response != 'failed') {
      placeAddress = response["result"][0]["formatted_address"];
    }

    return placeAddress;
  }
}
