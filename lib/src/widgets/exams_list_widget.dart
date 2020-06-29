import 'dart:async';

import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:appsaudeemmaos/src/resources/exam_repository.dart';
import 'package:appsaudeemmaos/src/ui/exam_details.dart';
import 'package:appsaudeemmaos/src/utils/data_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:async/async.dart';

class ExamsList extends StatefulWidget {
  int quantity;

  ExamsList({this.quantity});

  @override
  _ExamsListState createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  Future<List<Exam>> _future;

  Future<List<Exam>> getExams() async {
    List<Exam> exams = await ExamRepository.getExamsPatient();
    return exams;
  }

  @override
  void initState() {
    _future = getExams();
    super.initState();
  }

  int getItemCount(quantity, examsLength) {
    if (quantity != null) {
      if (quantity > examsLength) {
        return examsLength;
      } else {
        return quantity;
      }
    } else {
      return examsLength;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
          case ConnectionState.waiting:
            return Container(
              width: 200.0,
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
                strokeWidth: 5.0,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Container();
            } else if (snapshot.data.length == 0) {
              return Center(
                child: Text("Nenhum exame encontrado!"),
              );
            } else {
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      getItemCount(widget.quantity, snapshot.data.length),
                  itemBuilder: (context, index) {
                    Exam exam = snapshot.data[index];
                    return createExpansionListPanels(exam);
                  });
            }
        }
      },
      future: _future,
    );
  }

  Widget createExpansionListPanels(Exam exam) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          exam.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
            isExpanded: exam.isExpanded,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(
                  children: [
                    Text(
                      "#" + exam.examId.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          exam.examType,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            "Código: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            exam.examId.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Data: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            exam.exameCompletedDate != null
                                ? DataUtil.formatData(exam.exameCompletedDate)
                                : "N/A",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            "Exame: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                exam.examType,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Status: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            Exam.statusExam(exam.examStatus),
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text("Detalhes"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ExamDetailsScreen(exam)));
                    },
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
