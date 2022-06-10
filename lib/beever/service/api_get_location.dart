import 'dart:async';

import 'package:geolocator/geolocator.dart';

class GetLocationBeever {
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
}
