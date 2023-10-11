import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    required this.countryCode,
    required this.countryName,
    required this.city,
    this.postal,
    required this.latitude,
    required this.longitude,
    required this.iPv4,
    required this.state,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    countryCode: json['country_code'],
    countryName: json['country_name'],
    city: json['city'],
    postal: json['postal'],
    latitude: json['latitude'].toDouble(),
    longitude: json['longitude'].toDouble(),
    iPv4: json['IPv4'],
    state: json['state'],
  );

  String countryCode;
  String countryName;
  String city;
  dynamic postal;
  double latitude;
  double longitude;
  String iPv4;
  String state;

  Map<String, dynamic> toJson() => {
    'country_code': countryCode,
    'country_name': countryName,
    'city': city,
    'postal': postal,
    'latitude': latitude,
    'longitude': longitude,
    'IPv4': iPv4,
    'state': state,
  };
}
