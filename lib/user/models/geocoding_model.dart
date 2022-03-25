// To parse this JSON data, do
//
//     final geocodingModel = geocodingModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

GeocodingModel geocodingModelFromJson(String str) =>
    GeocodingModel.fromJson(json.decode(str));

String geocodingModelToJson(GeocodingModel data) => json.encode(data.toJson());

class GeocodingModel {
  GeocodingModel({
    this.plusCode,
    this.results,
    this.status,
  });

  final PlusCode? plusCode;
  final List<Result>? results;
  final String? status;

  factory GeocodingModel.fromJson(Map<String, dynamic> json) => GeocodingModel(
        plusCode: PlusCode.fromJson(json["plus_code"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "plus_code": plusCode?.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
      };
}

class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  final String? compoundCode;
  final String? globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}

class Result {
  Result({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.plusCode,
    this.types,
  });

  final List<AddressComponent>? addressComponents;
  final String? formattedAddress;
  final Geometry? geometry;
  final String? placeId;
  final PlusCode? plusCode;
  final List<String>? types;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(
            json["address_components"]
                .map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        types: List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "address_components":
            List<dynamic>.from(addressComponents!.map((x) => x.toJson())),
        "formatted_address": formattedAddress,
        "geometry": geometry!.toJson(),
        "place_id": placeId,
        "plus_code": plusCode == null ? null : plusCode!.toJson(),
        "types": List<dynamic>.from(types!.map((x) => x)),
      };
}

class AddressComponent {
  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  final String? longName;
  final String? shortName;
  final List<Type>? types;

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: List<Type>.from(json["types"].map((x) => typeValues.map![x])),
      );

  Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": List<dynamic>.from(types!.map((x) => typeValues.reverse![x])),
      };
}

enum Type {
  STREET_NUMBER,
  ROUTE,
  ADMINISTRATIVE_AREA_LEVEL_4,
  POLITICAL,
  ADMINISTRATIVE_AREA_LEVEL_3,
  ADMINISTRATIVE_AREA_LEVEL_2,
  ADMINISTRATIVE_AREA_LEVEL_1,
  COUNTRY,
  POSTAL_CODE,
  PLUS_CODE,
  LOCALITY
}

final typeValues = EnumValues({
  "administrative_area_level_1": Type.ADMINISTRATIVE_AREA_LEVEL_1,
  "administrative_area_level_2": Type.ADMINISTRATIVE_AREA_LEVEL_2,
  "administrative_area_level_3": Type.ADMINISTRATIVE_AREA_LEVEL_3,
  "administrative_area_level_4": Type.ADMINISTRATIVE_AREA_LEVEL_4,
  "country": Type.COUNTRY,
  "locality": Type.LOCALITY,
  "plus_code": Type.PLUS_CODE,
  "political": Type.POLITICAL,
  "postal_code": Type.POSTAL_CODE,
  "route": Type.ROUTE,
  "street_number": Type.STREET_NUMBER
});

class Geometry {
  Geometry({
    this.location,
    this.locationType,
    this.viewport,
    this.bounds,
  });

  final Location? location;
  final String? locationType;
  final Viewport? viewport;
  final Viewport? bounds;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        locationType: json["location_type"],
        viewport: Viewport.fromJson(json["viewport"]),
        bounds:
            json["bounds"] == null ? null : Viewport.fromJson(json["bounds"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location!.toJson(),
        "location_type": locationType,
        "viewport": viewport!.toJson(),
        "bounds": bounds == null ? null : bounds!.toJson(),
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  final Location? northeast;
  final Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast!.toJson(),
        "southwest": southwest!.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  final double? lat;
  final double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
