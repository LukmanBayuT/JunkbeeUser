// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromJson(jsonString);

import 'dart:convert';

CollectionModelBeever collectionModelBeeverFromJson(String str) =>
    CollectionModelBeever.fromJson(json.decode(str));

String collectionModelBeeverToJson(CollectionModelBeever data) =>
    json.encode(data.toJson());

class CollectionModelBeever {
  final int? success;
  final String? message;
  final List<Datum>? data;
  CollectionModelBeever({
    this.success,
    this.message,
    this.data,
  });

  factory CollectionModelBeever.fromJson(Map<String, dynamic> json) =>
      CollectionModelBeever(
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
  final String? orderCode;
  final String? userId;
  final DateTime? createdAt;
  final String? location1;
  final String? fullName;
  Datum({
    this.orderCode,
    this.userId,
    this.createdAt,
    this.location1,
    this.fullName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderCode: json["order_code"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        location1: json["location1"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "order_code": orderCode,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "location1": location1,
        "full_name": fullName,
      };
}
