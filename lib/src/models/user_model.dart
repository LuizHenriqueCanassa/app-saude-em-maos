import 'package:appsaudeemmaos/src/models/address_model.dart';

import 'address_model.dart';
import 'address_model.dart';
import 'dart:convert';

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
  static int id;
  static String cpf;
  static String name;
  static String phone;
  static String birthDate;
  static String insuranceNumber;
  static Address address;

  static void createUserSection(Map<String, dynamic> jsonBody){
      User.id = jsonBody["id"];
      User.name = jsonBody["name"];
      User.cpf = jsonBody["cpf"];
      User.phone = jsonBody["phone"];
      User.birthDate = jsonBody["birthDate"];
      User.insuranceNumber = jsonBody["insuranceNumber"];
      User.address = Address.fromJson(jsonBody["address"]);
  }
}
