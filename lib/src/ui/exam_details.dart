import 'dart:math';

import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:appsaudeemmaos/src/utils/data_util.dart';
import 'package:appsaudeemmaos/src/widgets/exam-details-areas/exam-details-clinic.dart';
import 'package:appsaudeemmaos/src/widgets/exam-details-areas/exam-details-doctor.dart';
import 'package:appsaudeemmaos/src/widgets/exam-details-areas/exam-details-exam-results.dart';
import 'package:appsaudeemmaos/src/widgets/exam-details-areas/exam-details-exam.dart';
import 'package:appsaudeemmaos/src/widgets/exam-details-areas/exam-details-patient.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExamDataItem {
  String headerValue;
  Widget bodyValue;
  bool isExpanded = false;

  ExamDataItem({this.headerValue, this.bodyValue});
}

class ExamDetailsScreen extends StatefulWidget {
  Exam exam;

  ExamDetailsScreen(this.exam);

  @override
  _ExamDetailsScreenState createState() => _ExamDetailsScreenState();
}

List<ExamDataItem> getListExamDataItems(Exam exam) {
  List<ExamDataItem> result = List<ExamDataItem>();

  result.add(ExamDataItem(
      headerValue: "Dados do Paciente", bodyValue: ExamDetailsPatientWidget()));

  result.add(ExamDataItem(
      headerValue: "Dados do Médico",
      bodyValue: ExamDetailsDoctorWidget(
        exam: exam,
      )));

  result.add(ExamDataItem(
      headerValue: "Dados da Clínica",
      bodyValue: ExamDetailsClinicWidget(
        exam: exam,
      )));

  result.add(ExamDataItem(
      headerValue: "Dados do Exame",
      bodyValue: ExamDetailsExamWidget(
        exam: exam,
      )));

  result.add(ExamDataItem(
      headerValue: "Resultados",
      bodyValue: ExamDetailsExamResultsWidget(
        exam: exam,
      )));

  return result;
}

class _ExamDetailsScreenState extends State<ExamDetailsScreen> {
  Exam examDetails;
  List<ExamDataItem> examDataItems;

  @override
  void initState() {
    examDetails = widget.exam;
    examDataItems = getListExamDataItems(examDetails);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "#" + examDetails.examId.toString() + " - Detalhes do Exame",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              examDataItems.map((e) => e.isExpanded = false);
              examDataItems[index].isExpanded = !isExpanded;
            });
          },
          children:
              examDataItems.map<ExpansionPanel>((ExamDataItem examDataItem) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(examDataItem.headerValue),
                  );
                },
                body: examDataItem.bodyValue,
                isExpanded: examDataItem.isExpanded);
          }).toList(),
        ),
      )),
    );
  }
}
