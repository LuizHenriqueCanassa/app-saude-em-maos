import 'package:appsaudeemmaos/src/widgets/bottom_navigation_widget.dart';
import 'package:appsaudeemmaos/src/widgets/drawer_menu_widget.dart';
import 'package:appsaudeemmaos/src/widgets/exams_list_widget.dart';
import 'package:flutter/material.dart';

class ExamsScreen extends StatefulWidget {
  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _examCodeController = TextEditingController();
  final _examNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1DE9B6),
        title: Text(
          "Health Place - Exames",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Filtrar",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Form(
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
                              child: TextFormField(
                                controller: _examCodeController,
                                decoration: InputDecoration(
                                  labelText: "Código",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: TextFormField(
                                controller: _examNameController,
                                decoration: InputDecoration(
                                  labelText: "Nome",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        "Filtrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Exames",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              ExamsList(15)
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomNavigation(context),
    );
  }
}
