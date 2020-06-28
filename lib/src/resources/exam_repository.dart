import 'dart:async';
import 'dart:convert';
import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class ExamRepository{
  static Future<List<Exam>> getExamsPatient() async{
    http.Response response = await http.get(
      "https://saude-em-maos.herokuapp.com/exam/PATIENT/${User.id}",
      headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );    
    
    if(response.statusCode == 200){
      var list = json.decode(utf8.decode(response.bodyBytes)) as List;
      return Exam.fromJsonList(list);
    }else{
      return null;
    }
  }
}