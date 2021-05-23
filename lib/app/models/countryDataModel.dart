class CountryDataModel {
  final country;
  final confirmed;
  final recovered;
  final critical;
  final deaths;

  CountryDataModel({
    this.country,
    this.confirmed,
    this.recovered,
    this.critical,
    this.deaths,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> map) {
    return CountryDataModel(
      country: map['country'],
      confirmed: map['confirmed'],
      recovered: map['recovered'],
      critical: map['critical'],
      deaths: map['deaths'],
    );
  }
}
