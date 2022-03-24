import 'dart:convert';

AuthResponse productFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String productToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  int? success;
  String? message;
  Data? data;
  AuthResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
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
  String? token;

  Data({
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
