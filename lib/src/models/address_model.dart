class Address {
  int id;
  String state;
  String city;
  String street;
  String number;
  String complement;

  Address({this.id, this.state, this.city, this.street, this.number,
      this.complement});

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
}