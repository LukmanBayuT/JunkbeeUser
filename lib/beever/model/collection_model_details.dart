// To parse this JSON data, do
//
//     final collectionModelDetails = collectionModelDetailsFromJson(jsonString);

import 'dart:convert';

CollectionModelDetails collectionModelDetailsFromJson(String str) =>
    CollectionModelDetails.fromJson(json.decode(str));

String collectionModelDetailsToJson(CollectionModelDetails data) =>
    json.encode(data.toJson());

class CollectionModelDetails {
  final int? success;
  final String? message;
  final List<Datum>? data;
  CollectionModelDetails({
    this.success,
    this.message,
    this.data,
  });

  factory CollectionModelDetails.fromJson(Map<String, dynamic> json) =>
      CollectionModelDetails(
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
  final String? location1;
  final DateTime? createdAt;
  final String? tempat;
  final dynamic notes;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? lat;
  final String? lng;
  final List<Detail>? detail;
  Datum({
    this.orderCode,
    this.userId,
    this.location1,
    this.createdAt,
    this.tempat,
    this.notes,
    this.fullName,
    this.email,
    this.phone,
    this.lat,
    this.lng,
    this.detail,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderCode: json["order_code"],
        userId: json["user_id"],
        location1: json["location1"],
        createdAt: DateTime.parse(json["created_at"]),
        tempat: json["tempat"],
        notes: json["notes"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        lat: json["lat"],
        lng: json["lng"],
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_code": orderCode,
        "user_id": userId,
        "location1": location1,
        "created_at": createdAt!.toIso8601String(),
        "tempat": tempat,
        "notes": notes,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "detail": List<dynamic>.from(detail!.map((x) => x.toJson())),
      };
}

class Detail {
  final int? id;
  final String? orderCode;
  final String? wasteType;
  final String? wasteWeight;
  final String? subtotal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Detail({
    this.id,
    this.orderCode,
    this.wasteType,
    this.wasteWeight,
    this.subtotal,
    this.createdAt,
    this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        orderCode: json["order_code"],
        wasteType: json["waste_type"],
        wasteWeight: json["waste_weight"],
        subtotal: json["subtotal"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_code": orderCode,
        "waste_type": wasteType,
        "waste_weight": wasteWeight,
        "subtotal": subtotal,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
