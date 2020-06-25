import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<ExamModel> gerarListaExame(int quantity) {
  return List.generate(quantity, (index) {
    return ExamModel(index, "Nome Exame $index", "Resultado do exame $index",
        DateTime.now(), "Status Teste");
  });
}

class ExamsList extends StatefulWidget {
  final int quantity;

  const ExamsList(this.quantity);

  @override
  _ExamsListState createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  List<ExamModel> _data;

  String _formatData(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((e) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(
                  children: <Widget>[
                    Text(
                      "#" + e.examCode.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(e.examType),
                    )
                  ],
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Código: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            e.examCode.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Exame: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            e.examType,
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
                            e.examStatus,
                            style: TextStyle(fontSize: 15),
                          )
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
                            _formatData(e.examDate),
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
            ),
            isExpanded: e.isExpanded);
      }).toList(),
    );
  }

  @override
  void initState() {
    _data = gerarListaExame(widget.quantity);
    super.initState();
  }
}
