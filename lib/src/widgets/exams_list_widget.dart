import 'dart:async';

import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:appsaudeemmaos/src/resources/exam_repository.dart';
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

  String _formatData(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(dateTime);
  }

  int getItemCount(quantity, examsLength){
    if(quantity != null){
      if(quantity > examsLength){
        return examsLength;
      }else{
        return quantity;
      }
    }else{
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
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                strokeWidth: 5.0,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Container();
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: getItemCount(widget.quantity, snapshot.data.length),
                  itemBuilder: (context, index) {
                    Exam exam = snapshot.data[index];
                    return ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          exam.isExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                            isExpanded: exam.isExpanded,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "#" + exam.examId.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(exam.examType),
                                    )
                                  ],
                                ),
                              );
                            },
                            body: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Código: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            exam.examId.toString(),
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Exame: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            exam.examType,
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Status: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            Exam.statusExam(exam.examStatus),
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Data: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            exam.exameCompletedDate != null
                                                ? exam.exameCompletedDate
                                                : "N/A",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RaisedButton(
                                    child: Text("Detalhes"),
                                    onPressed: () {},
                                    color: Theme.of(context).primaryColor,
                                  )
                                ],
                              ),
                            ))
                      ],
                    );
                  });
            }
        }
      },
      future: _future,
    );
  }

  // Widget createExpansionPanels(List<Exam> exams) {
  //   // print(exams);
  //   return ExpansionPanelList(
  //     expansionCallback: (int index, bool isExpanded) {
  //       setState(() {
  //         exams[index].isExpanded = !isExpanded;
  //       });
  //     },
  //     children: exams.map<ExpansionPanel>((e) {
  //       return ExpansionPanel(
  //           headerBuilder: (BuildContext context, bool isExpanded) {
  //             return ListTile(
  //               title: Row(
  //                 children: <Widget>[
  //                   Text(
  //                     "#" + e.examId.toString(),
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                   Container(
  //                     margin: EdgeInsets.only(left: 10),
  //                     child: Text(e.examType),
  //                   )
  //                 ],
  //               ),
  //             );
  //           },
  //           body: Container(
  //             padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
  //             child: Column(
  //               children: <Widget>[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Row(
  //                       children: <Widget>[
  //                         Text(
  //                           "Código: ",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 15),
  //                         ),
  //                         Text(
  //                           e.examId.toString(),
  //                           style: TextStyle(fontSize: 15),
  //                         )
  //                       ],
  //                     ),
  //                     Row(
  //                       children: <Widget>[
  //                         Text(
  //                           "Exame: ",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 15),
  //                         ),
  //                         Text(
  //                           e.examType,
  //                           style: TextStyle(fontSize: 15),
  //                         )
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Row(
  //                       children: <Widget>[
  //                         Text(
  //                           "Status: ",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 15),
  //                         ),
  //                         Text(
  //                           e.examStatus,
  //                           style: TextStyle(fontSize: 15),
  //                         )
  //                       ],
  //                     ),
  //                     Row(
  //                       children: <Widget>[
  //                         Text(
  //                           "Data: ",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 15),
  //                         ),
  //                         Text(
  //                           e.examRequestedDateTime,
  //                           style: TextStyle(fontSize: 15),
  //                         )
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 RaisedButton(
  //                   child: Text("Detalhes"),
  //                   onPressed: () {},
  //                   color: Theme.of(context).primaryColor,
  //                 )
  //               ],
  //             ),
  //           ),
  //           isExpanded: e.isExpanded);
  //     }).toList(),
  //   );
  // }

}
