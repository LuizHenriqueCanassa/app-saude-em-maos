import 'package:appsaudeemmaos/src/models/clinic_model.dart';
import 'package:appsaudeemmaos/src/models/doctor_model.dart';

class Exam{
  int examId;
  String exameCompletedDate;
  String examRequestedDateTime;
  String examType;
  String examStatus;
  String examData;
  Doctor doctor;
  Clinic clinic;
  bool isExpanded = false;

  Exam({this.examId, this.exameCompletedDate, this.examRequestedDateTime, this.examType, this.examStatus, this.examData, this.doctor, this.clinic});

  factory Exam.fromJson(Map<String, dynamic> json){
    return Exam(
      examId: json["id"],
      exameCompletedDate: json["examCompletedDate"],
      examRequestedDateTime: json["examRequestedDateTime"],
      examType: json["type"],
      examStatus: json["status"],
      examData: json["examData"],
      doctor: Doctor.fromJson(json["doctor"]),
      clinic: Clinic.fromJson(json["clinic"])
    );
  }

  static List<Exam> fromJsonList(List jsonList){
    List<Exam> examsRe = List<Exam>();
    jsonList.map((e){
       examsRe.add(Exam.fromJson(e));
    }).toList();
    return examsRe;
  }

  static String statusExam(String status){
    switch(status){
      case "EXAME_EM_ANDAMENTO":
        return "Em Andamento";
      case "EXAME_CONCLUIDO":
        return "Concluído";
      case "EXAME_ANALISADO":
        return "Analisado";
    }
  }
}