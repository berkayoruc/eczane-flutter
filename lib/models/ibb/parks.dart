class ParksIBB {
  double _lat;
  double _lon;
  String _name;
  String _neighborhood;
  String _county;
  int _id;

  ParksIBB(
    this._lat,
    this._lon,
    this._name,
    this._neighborhood,
    this._county,
    this._id,
  );

  factory ParksIBB.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return ParksIBB(json['LATITUDE'], json['LONGITUDE'], json['NAME'],
          json['NEIGHBORHOOD_NAME'], json['COUNTY_NAME'], json['_id']);
    }
  }

  double get lat => _lat;
  double get lon => _lon;
  String get name => _name;
  String get neighborhood => _neighborhood;
  String get county => _county;
  int get id => _id;
}
