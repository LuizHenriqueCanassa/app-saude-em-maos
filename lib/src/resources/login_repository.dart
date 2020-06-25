import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository{

  Future<Map<String, dynamic>> validateLogin(String username, String password) async{
    http.Response response = await http.get(
        "https://saude-em-maos.herokuapp.com/accesses",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}