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
    "status1": "Status 1",
    "status2": "Status 2",
    "status3": "Status 3"
  };
  List<DropdownMenuItem<String>> _dropDownMenuExamStatus;
  String _currentExamStatus;

  @override
  void initState() {
    _dropDownMenuExamStatus = _getDropDownMenuExamStatus();
    _currentExamStatus = _dropDownMenuExamStatus[0].value;
    print(_dropDownMenuExamStatus);
    super.initState();
  }

  List<DropdownMenuItem<String>> _getDropDownMenuExamStatus() {
    List<DropdownMenuItem<String>> items = new List();
    _examStatus.forEach((key, value) {
      items.add(new DropdownMenuItem(value: key, child: new Text(value)));
    });
    print(items);
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

  void _cleanFieldsFilter(){
    setState(() {
      _examCodeController.text = "";
      _examNameController.text = "";
      _examDateInitialController.text = "";
      _examDateFinalController.text = "";
      _currentExamStatus =  _dropDownMenuExamStatus[0].value;
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
                    margin: EdgeInsets.only(right: 5),
                    child: BuildTextFieldWidget(
                        "Código", _examCodeController, TextInputType.number),
                  ),
                ),
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
                      underline: Container(color: Colors.black54, height: 1,),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _examNameController,
              decoration: InputDecoration(
                labelText: "Nome",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BuildTextFieldWidget(
                      "Data Inicial",
                      _examDateInitialController,
                      TextInputType.datetime,
                      readyOnly: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    child: Text(
                      "Escolher",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFF283593),
                    onPressed: () {
                      _alterDateInput(_examDateInitialController);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    child: Text(
                      "Limpar",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFFe53935),
                    onPressed: () {
                      _cleanDateInput(_examDateInitialController);
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BuildTextFieldWidget(
                      "Data Final",
                      _examDateFinalController,
                      TextInputType.datetime,
                      readyOnly: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    child: Text(
                      "Escolher",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFF283593),
                    onPressed: () {
                      _alterDateInput(_examDateFinalController);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    child: Text(
                      "Limpar",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFFe53935),
                    onPressed: () {
                      _cleanDateInput(_examDateFinalController);
                    },
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
              SizedBox(height: 10, width: 10,),
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
