import 'package:flutter/material.dart';

import '../../models/exam_model.dart';
import '../../models/user_model.dart';
import '../../utils/data_util.dart';
import '../../utils/data_util.dart';

class ExamDetailsPatientWidget extends StatefulWidget {
  @override
  _ExamDetailsPatientWidgetState createState() =>
      _ExamDetailsPatientWidgetState();
}

class _ExamDetailsPatientWidgetState extends State<ExamDetailsPatientWidget> {
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
              Text(User.name)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "CPF: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(User.cpf)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Número do Plano: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(User.insuranceNumber)
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
              Text(User.phone)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Data de Nascimento: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(DataUtil.formatData(User.birthDate))
            ],
          ),
        ],
      ),
    );
  }
}
