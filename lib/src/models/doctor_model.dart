class Doctor{
  int id;
  String name;
  String phone;
  String crm;

  Doctor({this.id, this.name, this.phone, this.crm});

  factory Doctor.fromJson(Map<String, dynamic> json){
    return Doctor(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      crm: json["crm"]
    );
  }
}