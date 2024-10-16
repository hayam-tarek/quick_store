class AddressModel {
  int id;
  String name;
  String city;
  String region;
  String details;
  String? notes;
  double latitude;
  double longitude;

  AddressModel({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    this.notes,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        region: json["region"],
        details: json["details"],
        notes: json["notes"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );
}
