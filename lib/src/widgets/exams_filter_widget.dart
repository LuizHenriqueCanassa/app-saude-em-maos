import 'package:appsaudeemmaos/src/widgets/build_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExamsFilterWidget extends StatefulWidget {
  @override
  _ExamsFilterWidgetState createState() => _ExamsFilterWidgetState();
}

class _ExamsFilterWidgetState extends State<ExamsFilterWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _examCodeController = TextEditingController();
  final _examNameController = TextEditingController();
  TextEditingController _examDateInitialController = TextEditingController();
  TextEditingController _examDateFinalController = TextEditingController();

  Map<String, String> _examStatus = {
    "": "Status do Exame",
    "EXAME_EM_ANDAMENTO": "Em Andamento",
    "EXAME_CONCLUIDO": "Concluído",
    "EXAME_ANALISADO": "Analisado"
  };
  List<DropdownMenuItem<String>> _dropDownMenuExamStatus;
  String _currentExamStatus;

  @override
  void initState() {
    _dropDownMenuExamStatus = _getDropDownMenuExamStatus();
    _currentExamStatus = _dropDownMenuExamStatus[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> _getDropDownMenuExamStatus() {
    List<DropdownMenuItem<String>> items = new List();
    _examStatus.forEach((key, value) {
      items.add(new DropdownMenuItem(value: key, child: new Text(value)));
    });
    return items;
  }

  void _changedExameStatus(String examStatus) {
    setState(() {
      _currentExamStatus = examStatus;
    });
  }

  void _alterDateInput(TextEditingController controller) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2500))
        .then((date) {
      setState(() {
        controller.text = dateFormat.format(date);
      });
    });
  }

  void _cleanDateInput(TextEditingController controller) {
    setState(() {
      controller.text = "";
    });
  }

  void _cleanFieldsFilter() {
    setState(() {
      _examCodeController.text = "";
      _examNameController.text = "";
      _examDateInitialController.text = "";
      _examDateFinalController.text = "";
      _currentExamStatus = _dropDownMenuExamStatus[0].value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 5, top: 19),
                    child: DropdownButton(
                      value: _currentExamStatus,
                      items: _dropDownMenuExamStatus,
                      onChanged: _changedExameStatus,
                      isExpanded: true,
                      isDense: true,
                      underline: Container(
                        color: Colors.black54,
                        height: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "Filtrar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              RaisedButton(
                child: Text(
                  "Limpar Filtros",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _cleanFieldsFilter();
                },
                color: Color(0xFFe53935),
              )
            ],
          )
        ],
      ),
    );
  }
}
