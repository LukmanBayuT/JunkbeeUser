import 'dart:convert';

BeeverData beeverDataFromJson(String str) =>
    BeeverData.fromJson(jsonDecode(str));

String beeverDataToJson(BeeverData data) => json.encode(data.toJson());

class BeeverData {
  final int? success;
  final String? message;
  final Data? data;

  BeeverData({
    this.success,
    this.message,
    this.data,
  });

  factory BeeverData.fromJson(Map<String, dynamic> json) => BeeverData(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
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
  final String? image;
  final dynamic ktp;
  final dynamic emailVerifiedAt;

  Data({
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
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
      };
}
