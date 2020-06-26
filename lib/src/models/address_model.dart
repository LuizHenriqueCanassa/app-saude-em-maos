class Address {
  int _id;
  String _state;
  String _city;
  String _street;
  String _number;
  String _complement;

  Address(this._id, this._state, this._city, this._street, this._number,
      this._complement);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json["id"], json["state"], json["city"], json["street"],
        json["number"], json["complement"]);
  }

  int get id => _id;
  String get state => _state;
  String get city => _city;
  String get street => _street;
  String get number => _number;
  String get complement => _complement;
}
