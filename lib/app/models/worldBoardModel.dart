class WorldBoardModel {
  final confirmed;
  final recovered;
  final critical;
  final deaths;

  WorldBoardModel({
    this.confirmed,
    this.recovered,
    this.critical,
    this.deaths,
  });

  factory WorldBoardModel.fromJson(Map<String, dynamic> map) {
    return WorldBoardModel(
      confirmed: map['confirmed'],
      recovered: map['recovered'],
      critical: map['critical'],
      deaths: map['deaths'],
    );
  }
}
