import 'package:appsaudeemmaos/src/widgets/bottom_navigation_widget.dart';
import 'package:appsaudeemmaos/src/widgets/drawer_menu_widget.dart';
import 'package:appsaudeemmaos/src/widgets/exams_filter_widget.dart';
import 'package:appsaudeemmaos/src/widgets/exams_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamsScreen extends StatefulWidget {
  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
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
          margin: EdgeInsets.only(top: 30, right: 10, bottom: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Buscar Exames",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ExamsFilterWidget(),
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
              ExamsList()
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
