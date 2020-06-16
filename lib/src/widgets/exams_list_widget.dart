import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:flutter/material.dart';

List<ExamModel> gerarListaExame(int quantity){
  return List.generate(quantity, (index){
    return ExamModel(
        index,
        "Nome Exame $index",
        "Resultado do exame $index",
        DateTime.now()
    );
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
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((e){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded){
            return
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Text("#" + e.examCode.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(e.examName),
                      )
                    ],
                  ),
                );
          },
          body: Text(
            e.examResults
          ),
          isExpanded: e.isExpanded
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    _data = gerarListaExame(widget.quantity);
    super.initState();
  }
}

