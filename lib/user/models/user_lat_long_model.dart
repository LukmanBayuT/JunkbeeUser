// To parse this JSON data, do
//
//     final usetLatLong = usetLatLongFromJson(jsonString);

import 'dart:convert';

UserLatLong usetLatLongFromJson(String str) =>
    UserLatLong.fromJson(json.decode(str));

String usetLatLongToJson(UserLatLong data) => json.encode(data.toJson());

class UserLatLong {
  UserLatLong({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final List<dynamic>? data;

  factory UserLatLong.fromJson(Map<String, dynamic> json) => UserLatLong(
        success: json["success"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
