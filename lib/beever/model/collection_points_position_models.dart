// To parse this JSON data, do
//
//     final collectionPoints = collectionPointsFromJson(jsonString);

import 'dart:convert';

CollectionPoints collectionPointsFromJson(String str) =>
    CollectionPoints.fromJson(json.decode(str));

String collectionPointsToJson(CollectionPoints data) =>
    json.encode(data.toJson());

class CollectionPoints {
  CollectionPoints({
    this.collectionpoint,
  });

  final List<Collectionpoint>? collectionpoint;

  factory CollectionPoints.fromJson(Map<String, dynamic> json) =>
      CollectionPoints(
        collectionpoint: List<Collectionpoint>.from(
            json["collectionpoint"].map((x) => Collectionpoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "collectionpoint":
            List<dynamic>.from(collectionpoint!.map((x) => x.toJson())),
      };
}

class Collectionpoint {
  Collectionpoint({
    this.id,
    this.name,
    this.description,
    this.city,
    this.alamat,
    this.latitude,
    this.longitude,
    this.pictureId,
    this.keramaian,
    this.jenisSampah,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? city;
  final String? alamat;
  final double? latitude;
  final double? longitude;
  final String? pictureId;
  final double? keramaian;
  final JenisSampah? jenisSampah;

  factory Collectionpoint.fromJson(Map<String, dynamic> json) =>
      Collectionpoint(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        alamat: json["alamat"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        pictureId: json["pictureId"],
        keramaian: json["keramaian"].toDouble(),
        jenisSampah: JenisSampah.fromJson(json["jenisSampah"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "alamat": alamat,
        "latitude": latitude,
        "longitude": longitude,
        "pictureId": pictureId,
        "keramaian": keramaian,
        "jenisSampah": jenisSampah!.toJson(),
      };
}

class JenisSampah {
  JenisSampah({
    this.kardus,
    this.nonKardus,
  });

  final String? kardus;
  final String? nonKardus;

  factory JenisSampah.fromJson(Map<String, dynamic> json) => JenisSampah(
        kardus: json["kardus"],
        nonKardus: json["nonKardus"],
      );

  Map<String, dynamic> toJson() => {
        "kardus": kardus,
        "nonKardus": nonKardus,
      };
}
