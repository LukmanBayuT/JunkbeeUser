// To parse this JSON data, do
//
//     final beeverLatLongUpdate = beeverLatLongUpdateFromJson(jsonString);

import 'dart:convert';

BeeverLatLongUpdate beeverLatLongUpdateFromJson(String str) =>
    BeeverLatLongUpdate.fromJson(json.decode(str));

String beeverLatLongUpdateToJson(BeeverLatLongUpdate data) =>
    json.encode(data.toJson());

class BeeverLatLongUpdate {
  BeeverLatLongUpdate({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final List<Datum>? data;

  factory BeeverLatLongUpdate.fromJson(Map<String, dynamic> json) =>
      BeeverLatLongUpdate(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.beeverId,
    this.lat,
    this.lng,
    this.status,
  });

  final int? beeverId;
  final dynamic lat;
  final dynamic lng;
  final String? status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        beeverId: json["beever_id"],
        lat: json["lat"],
        lng: json["lng"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "beever_id": beeverId,
        "lat": lat,
        "lng": lng,
        "status": status,
      };
}
