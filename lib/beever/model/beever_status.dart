// To parse this JSON data, do
//
//     final beeverStatus = beeverStatusFromJson(jsonString);

import 'dart:convert';

BeeverStatus beeverStatusFromJson(String str) =>
    BeeverStatus.fromJson(json.decode(str));

String beeverStatusToJson(BeeverStatus data) => json.encode(data.toJson());

class BeeverStatus {
  BeeverStatus({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final List<dynamic>? data;

  factory BeeverStatus.fromJson(Map<String, dynamic> json) => BeeverStatus(
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
