class Address {
  int _id;
  String _state;
  String _city;
  String _street;
  String _number;
  String _complement;

  Address({id, state, city, street, number,
      complement});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json["id"], 
        state: json["state"], 
        city: json["city"], 
        street: json["street"],
        number:  json["number"], 
        complement: json["complement"]
      );
  }

  int get id => _id;
  String get state => _state;
  String get city => _city;
  String get street => _street;
  String get number => _number;
  String get complement => _complement;
}
