// To parse this JSON data, do
//
//     final userHistoryDataCollection = userHistoryDataCollectionFromJson(jsonString);

import 'dart:convert';

UserHistoryDataCollection userHistoryDataCollectionFromJson(String str) =>
    UserHistoryDataCollection.fromJson(json.decode(str));

String userHistoryDataCollectionToJson(UserHistoryDataCollection data) =>
    json.encode(data.toJson());

class UserHistoryDataCollection {
  UserHistoryDataCollection({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final List<Datum>? data;

  factory UserHistoryDataCollection.fromJson(Map<String, dynamic> json) =>
      UserHistoryDataCollection(
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
    this.orderCode,
    this.date,
    this.totalWeight,
    this.total,
    this.feeBeever,
    this.status,
    this.location1,
    this.location2,
    this.tempat,
    this.notes,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.driverName,
  });

  final int? id;
  final String? orderCode;
  final DateTime? date;
  final String? totalWeight;
  final String? total;
  final String? feeBeever;
  final String? status;
  final String? location1;
  final dynamic location2;
  final String? tempat;
  final String? notes;
  final dynamic reason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userName;
  final String? driverName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderCode: json["order_code"],
        date: DateTime.parse(json["date"]),
        totalWeight: json["total_weight"],
        total: json["total"],
        feeBeever: json["fee_beever"],
        status: json["status"],
        location1: json["location1"],
        location2: json["location2"],
        tempat: json["tempat"],
        notes: json["notes"],
        reason: json["reason"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
        driverName: json["driver_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_code": orderCode,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total_weight": totalWeight,
        "total": total,
        "fee_beever": feeBeever,
        "status": status,
        "location1": location1,
        "location2": location2,
        "tempat": tempat,
        "notes": notes,
        "reason": reason,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user_name": userName,
        "driver_name": driverName,
      };
}
