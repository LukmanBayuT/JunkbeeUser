// To parse this JSON data, do
//
//     final collectionData = collectionDataFromJson(jsonString);

// ignore_for_file: constant_identifier_names, duplicate_ignore, unnecessary_new, prefer_conditional_assignment

import 'dart:convert';

CollectionData collectionDataFromJson(String str) =>
    CollectionData.fromJson(json.decode(str));

String collectionDataToJson(CollectionData data) => json.encode(data.toJson());

class CollectionData {
  CollectionData({
    this.success,
    this.message,
    this.data,
  });

  final int? success;
  final String? message;
  final List<Datum>? data;

  factory CollectionData.fromJson(Map<String, dynamic> json) => CollectionData(
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
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.userName,
  });

  final int? id;
  final String? orderCode;
  final DateTime? date;
  final String? totalWeight;
  final String? total;
  final String? feeBeever;
  final Status? status;
  final Location1? location1;
  final Location2? location2;
  final dynamic reason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserName? userName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderCode: json["order_code"],
        date: DateTime.parse(json["date"]),
        totalWeight: json["total_weight"],
        total: json["total"],
        feeBeever: json["fee_beever"],
        status: statusValues.map![json["status"]],
        location1: location1Values.map![json["location1"]],
        location2: location2Values.map![json["location2"]],
        reason: json["reason"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: userNameValues.map![json["user_name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_code": orderCode,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total_weight": totalWeight,
        "total": total,
        "fee_beever": feeBeever,
        "status": statusValues.reverse[status],
        "location1": location1Values.reverse[location1],
        "location2": location2Values.reverse[location2],
        "reason": reason,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user_name": userNameValues.reverse[userName],
      };
}

enum Location1 { JL_JL, NULL, SEMARANG_PLAZA_KOTA_SEMARANG_INDONESIA_50137 }

final location1Values = EnumValues({
  "Jl.Jl": Location1.JL_JL,
  "null": Location1.NULL,
  "Semarang Plaza, Kota Semarang, Indonesia, 50137":
      Location1.SEMARANG_PLAZA_KOTA_SEMARANG_INDONESIA_50137
});

enum Location2 { EMPTY }

final location2Values = EnumValues({" ": Location2.EMPTY});

enum Status { SUCEED }

final statusValues = EnumValues({"suceed": Status.SUCEED});

enum UserName { LUCY_VER }

final userNameValues = EnumValues({"Lucy Ver": UserName.LUCY_VER});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => MapEntry(v, k));
    }
    return reverseMap!;
  }
}
