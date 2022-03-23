// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_place/google_place.dart';

// class Directions {
//   final LatLngBounds bounds;
//   final List<PointLatLng> polylinePoints;
//   final String totalDistance;
//   final String totalDuration;

//   const Directions({
//     required this.bounds,
//     required this.polylinePoints,
//     required this.totalDistance,
//     required this.totalDuration,
//   });

//   factory Directions.fromMap(Map<String, dynamic> map) {
//     if ((map['routes'] as List).isEmpty) {}

//     final data = Map<String, dynamic>.from(map['routes'][0]);

//     final northeast = data['bounds']['northeast'];
//     final southwest = data['bounds']['southwest'];
//     final bounds = LatLngBounds(southwest: southwest, northeast: northeast)
//   }
// }
