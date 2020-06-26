import 'dart:async';
import 'dart:convert';
import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  static Future<UserValidate> validateLogin(
      String username, String password) async {
    http.Response response = await http.post(
        "https://saude-em-maos.herokuapp.com/access",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      return UserValidate.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      return null;
    }
  }

  static Future<User> createUserSession(UserValidate userValidate) async {
    http.Response response = await http.get(
        "https://saude-em-maos.herokuapp.com/patient/${userValidate.userTypeEnum}");

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
