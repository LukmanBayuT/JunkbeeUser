// To parse this JSON data, do
//
//     final addCollection = addCollectionFromJson(jsonString);

import 'dart:convert';

AddCollection addCollectionFromJson(String str) =>
    AddCollection.fromJson(json.decode(str));

String addCollectionToJson(AddCollection data) => json.encode(data.toJson());

class AddCollection {
  AddCollection({
    required this.success,
    required this.message,
    required this.data,
  });

  final int success;
  final String message;
  final List<Datum> data;

  factory AddCollection.fromJson(Map<String, dynamic> json) => AddCollection(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.orderCode,
    required this.userId,
    this.driverId,
    this.wasteCollectorId,
    required this.date,
    required this.totalWeight,
    required this.total,
    required this.feeBeever,
    required this.status,
    required this.location1,
    required this.location2,
    this.reason,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String orderCode;
  final String userId;
  final dynamic driverId;
  final dynamic wasteCollectorId;
  final DateTime date;
  final String totalWeight;
  final String total;
  final String feeBeever;
  final String status;
  final String location1;
  final String location2;
  final dynamic reason;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderCode: json["order_code"],
        userId: json["user_id"],
        driverId: json["driver_id"],
        wasteCollectorId: json["waste_collector_id"],
        date: DateTime.parse(json["date"]),
        totalWeight: json["total_weight"],
        total: json["total"],
        feeBeever: json["fee_beever"],
        status: json["status"],
        location1: json["location1"],
        location2: json["location2"],
        reason: json["reason"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_code": orderCode,
        "user_id": userId,
        "driver_id": driverId,
        "waste_collector_id": wasteCollectorId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "total_weight": totalWeight,
        "total": total,
        "fee_beever": feeBeever,
        "status": status,
        "location1": location1,
        "location2": location2,
        "reason": reason,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
