// To parse this JSON data, do
//
//     final wastePrice = wastePriceFromJson(jsonString);

import 'dart:convert';

WastePrice wastePriceFromJson(String str) =>
    WastePrice.fromJson(json.decode(str));

String wastePriceToJson(WastePrice data) => json.encode(data.toJson());

class WastePrice {
  WastePrice({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final List<Datum>? data;

  factory WastePrice.fromJson(Map<String, dynamic> json) => WastePrice(
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
    this.id,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? type;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
