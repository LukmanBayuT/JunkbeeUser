// To parse this JSON data, do
//
//     final wasteList = wasteListFromJson(jsonString);

import 'dart:convert';

WasteList wasteListFromJson(String str) => WasteList.fromJson(json.decode(str));

String wasteListToJson(WasteList data) => json.encode(data.toJson());

class WasteList {
  final int? success;
  final String? message;
  final List<Datum>? data;
  WasteList({
    this.success,
    this.message,
    this.data,
  });

  factory WasteList.fromJson(Map<String, dynamic> json) => WasteList(
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
  final int? id;
  final String? type;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Datum({
    this.id,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
