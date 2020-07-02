import 'package:flutter/material.dart';

import '../../models/exam_model.dart';

class ExamDetailsDoctorWidget extends StatefulWidget {
  Exam exam;

  ExamDetailsDoctorWidget({this.exam});
  @override
  _ExamDetailsDoctorWidgetState createState() =>
      _ExamDetailsDoctorWidgetState();
}

class _ExamDetailsDoctorWidgetState extends State<ExamDetailsDoctorWidget> {
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
              Text(exam.doctor.name)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "CRM: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.doctor.crm)
            ],
          ),
        ],
      ),
    );
  }
}
