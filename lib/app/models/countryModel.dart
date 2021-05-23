class CountryModel {
  final country;
  final countryCode;
  final latitude;
  final longitude;

  CountryModel({
    this.country,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  factory CountryModel.fromJson(Map<String, dynamic> map) {
    return CountryModel(
      country: map['name'],
      countryCode: map['alpha2code'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
