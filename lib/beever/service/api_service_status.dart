import 'package:flutter/foundation.dart';
import 'package:junkbee_user/beever/model/beever_status.dart';
import 'package:http/http.dart' as http;

class ApiServiceStatusBeever {
  Future<BeeverStatus> patchStatusReady() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMSIsImp0aSI6ImJhNmUxNzE5YTBjZTEzM2NjMjJjOGI0NzUwNWJlYjJkYWU5MDc5NDk4MjAyMzMyNDdiODAzZTJjMTIxZDVmOWQyZThhMmZmZGI3ZTJlNDRhIiwiaWF0IjoxNjU2MzI0MDgxLjE2MDM0OSwibmJmIjoxNjU2MzI0MDgxLjE2MDM1NSwiZXhwIjoxNjg3ODYwMDgxLjE1NTUxMSwic3ViIjoiMTkiLCJzY29wZXMiOltdfQ.D1wwtb10X1anfFIYExrtQliYnyNODYXg3VluQ3Pn8l_PTZkZIEYpakDW8vtAh1LC0sWxrrOIP8JdYeICaXxy8M5ZbGaewX41qqVnbjAQK3MtHUwU3pD_qx13NG-MrMTmigQNRbrh3cFG3_o89V5o9PIDKc_3IGof0HdfC4J9d3TQO1xVdkM2NS639NINfTa2I49m-Dy6_i_TdYmmd96h6BamL10eaD8xSR51z6XQOWoqV4z8DShqgfB6jnpN_pnvhgKvuHIZl9SEEBrCdzHUncbqUgaCvxNyHJCp6jdPO0JrI3FbTsz6g7wWPS-2bfYNG_phqtc6qhUU-hc-RLs8ra8pf3vbKyYdy6aYzl4dF07QOiy3bhJHW7rk00jwUAnNbh_RiwRksgydBykX9_7eoipMY71Jo8yQKbv5wMJxrSJ7A-7QqHvjM9XawYfafs9DDvV2Eseb_FpuvDBUAGsW1ytZjx9bveRXoF3yaxi5AIsVtmACddG8t_G3X5WSOcnqQ3rcjP5tEa1lpXTN2qC6k2X0jp9Ggp66Owyl3T8Omt5H8lL_NkcZ8H7HmFphsxFhJ0em8TNlA0am1-HB9f4yuKbn4TKQZU5WItuKbtdvIhHfgQpJxAJAz2BJKoPM6hHsTI5uC3-DkYIfpXRRV8tqG0JNSHWjY5dwnCpmC143Cv8'
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
