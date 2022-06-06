// To parse this JSON data, do
//
//     final beeverConfirmation = beeverConfirmationFromJson(jsonString);

import 'dart:convert';

BeeverConfirmation beeverConfirmationFromJson(String str) =>
    BeeverConfirmation.fromJson(json.decode(str));

String beeverConfirmationToJson(BeeverConfirmation data) =>
    json.encode(data.toJson());

class BeeverConfirmation {
  BeeverConfirmation({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final Data? data;

  factory BeeverConfirmation.fromJson(Map<String, dynamic> json) =>
      BeeverConfirmation(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.total,
  });

  final String? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
