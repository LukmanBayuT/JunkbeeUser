// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
  final int? success;
  final String? message;
  final List<Datum>? data;

  NewsData({
    this.success,
    this.message,
    this.data,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
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
  final String? userId;
  final String? judul;
  final String? bannerDesctiption;
  final String? slug;
  final DateTime? date;
  final String? desctiption;
  final String? banner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;
  Datum({
    this.id,
    this.userId,
    this.judul,
    this.bannerDesctiption,
    this.slug,
    this.date,
    this.desctiption,
    this.banner,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        judul: json["judul"],
        bannerDesctiption: json["banner_desctiption"],
        slug: json["slug"],
        date: DateTime.parse(json["date"]),
        desctiption: json["desctiption"],
        banner: json["banner"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "judul": judul,
        "banner_desctiption": bannerDesctiption,
        "slug": slug,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "desctiption": desctiption,
        "banner": banner,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? email;
  final String? fullName;
  final String? address;
  final dynamic lat;
  final dynamic lng;
  final String? phone;
  final String? role;
  final String? active;
  final String? verified;
  final String? balance;
  final dynamic deviceToken;
  final dynamic googleId;
  final dynamic facebookId;
  final dynamic selfie;
  final dynamic image;
  final dynamic ktp;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  User({
    this.id,
    this.email,
    this.fullName,
    this.address,
    this.lat,
    this.lng,
    this.phone,
    this.role,
    this.active,
    this.verified,
    this.balance,
    this.deviceToken,
    this.googleId,
    this.facebookId,
    this.selfie,
    this.image,
    this.ktp,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        fullName: json["full_name"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
        phone: json["phone"],
        role: json["role"],
        active: json["active"],
        verified: json["verified"],
        balance: json["balance"],
        deviceToken: json["device_token"],
        googleId: json["google_id"],
        facebookId: json["facebook_id"],
        selfie: json["selfie"],
        image: json["image"],
        ktp: json["ktp"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "full_name": fullName,
        "address": address,
        "lat": lat,
        "lng": lng,
        "phone": phone,
        "role": role,
        "active": active,
        "verified": verified,
        "balance": balance,
        "device_token": deviceToken,
        "google_id": googleId,
        "facebook_id": facebookId,
        "selfie": selfie,
        "image": image,
        "ktp": ktp,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
