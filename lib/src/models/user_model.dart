import 'package:appsaudeemmaos/src/models/address_model.dart';

import 'address_model.dart';
import 'address_model.dart';

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
  static int _id = 0;
  static String _cpf = "";
  static String _name = "";
  static String _phone = "";
  static String _birthDate = "";
  static String _insuranceNumber = "";
  static Address _address = new Address();

  static void createUserSection(Map<String, dynamic> json){
      User._id = json["id"];
      User._name = json["name"];
      User._cpf = json["cpf"];
      User._phone = json["phone"];
      User._birthDate = json["birthDate"];
      User._insuranceNumber = json["insuranceNumber"];
      User._address = Address.fromJson(json["address"]);
  }

  static int get id => _id;
  static String get cpf => _cpf;
  static String get name => _name;
  static String get phone => _phone;
  static String get birthDate => _birthDate;
  static String get insuranceNumber => _insuranceNumber;
  static Address get address => _address;
}
