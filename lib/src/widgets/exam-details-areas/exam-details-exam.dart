import 'package:flutter/material.dart';

import '../../models/exam_model.dart';
import '../../utils/data_util.dart';

class ExamDetailsExamWidget extends StatefulWidget {
  Exam exam;

  ExamDetailsExamWidget({this.exam});
  @override
  _ExamDetailsExamWidgetState createState() => _ExamDetailsExamWidgetState();
}

class _ExamDetailsExamWidgetState extends State<ExamDetailsExamWidget> {
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
                "Código: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.examId.toString())
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Tipo: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(exam.examType)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Status: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(Exam.statusExam(exam.examStatus))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Data de Conclusão: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(DataUtil.formatData(exam.exameCompletedDate))
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
