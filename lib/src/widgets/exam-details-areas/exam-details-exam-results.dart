import 'package:flutter/material.dart';

import '../../models/exam_model.dart';
import '../../extensions/string_extension.dart';

class ExamDetailsExamResultsWidget extends StatefulWidget {
  Exam exam;

  ExamDetailsExamResultsWidget({this.exam});
  @override
  _ExamDetailsExamResultsWidgetState createState() =>
      _ExamDetailsExamResultsWidgetState();
}

class _ExamDetailsExamResultsWidgetState
    extends State<ExamDetailsExamResultsWidget> {
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
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: exam.examData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          exam.examData[index].key.capitalize() + ": ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          exam.examData[index].value.capitalize(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
