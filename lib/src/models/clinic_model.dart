import 'address_model.dart';
import 'address_model.dart';

class Clinic{
  int id;
  String name;
  String phone;
  String cnpj;
  Address address;

  Clinic({this.id, this.name, this.phone, this.cnpj, this.address});

  factory Clinic.fromJson(Map<String, dynamic> json){
    return Clinic(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      cnpj: json["cnpj"],
      address: Address.fromJson(json["address"])
    );
  }
}