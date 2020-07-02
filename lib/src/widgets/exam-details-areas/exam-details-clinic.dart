import 'package:flutter/material.dart';

import '../../models/exam_model.dart';

class ExamDetailsClinicWidget extends StatefulWidget {
  Exam exam;

  ExamDetailsClinicWidget({this.exam});
  @override
  _ExamDetailsClinicWidgetState createState() =>
      _ExamDetailsClinicWidgetState();
}

class _ExamDetailsClinicWidgetState extends State<ExamDetailsClinicWidget> {
  Exam exam;

  @override
  void initState() {
    exam = widget.exam;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, bottom: 20, left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Nome: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.name)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "CNPJ: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.cnpj)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Telefone: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.phone)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Rua: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.address.street)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Número: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.address.number)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Cidade: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.address.city)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Estado: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.clinic.address.state)
            ],
          ),
        ],
      ),
    );
  }
}
