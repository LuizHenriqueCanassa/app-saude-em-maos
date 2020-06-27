import 'package:appsaudeemmaos/src/models/address_model.dart';

class UserValidate {
  String _userTypeEnum;
  int _userId;

  UserValidate(this._userTypeEnum, this._userId);

  factory UserValidate.fromJson(Map<String, dynamic> json) {
    return UserValidate(json['userTypeEnum'], json['userId']);
  }

  String get userTypeEnum => _userTypeEnum;
  int get userId => _userId;
}

class User {
  int _id;
  String _cpf;
  String _name;
  String _phone;
  String _birthDate;
  String _insuranceNumber;
  Address _address;

  User(this._id, this._cpf, this._name, this._phone, this._birthDate,
      this._insuranceNumber, this._address);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json["id"],
        json["cpf"],
        json["name"],
        json["phone"],
        json["birthDate"],
        json["insuranceNumber"],
        Address.fromJson(json["address"]));
  }

  factory User.fromUser(User user) {
    return User(user.id, user.cpf, user.name, user.phone, user.birthDate,
        user.insuranceNumber, user.address);
  }

  int get id => _id;
  String get cpf => _cpf;
  String get name => _name;
  String get phone => _phone;
  String get birthDate => _birthDate;
  String get insuranceNumber => _insuranceNumber;
  Address get address => _address;
}
