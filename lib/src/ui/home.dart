import 'package:appsaudeemmaos/src/widgets/bottom_navigation_widget.dart';
import 'package:appsaudeemmaos/src/widgets/card_profile_widget.dart';
import 'package:appsaudeemmaos/src/widgets/drawer_menu_widget.dart';
import 'package:appsaudeemmaos/src/widgets/exams_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1DE9B6),
        title: Text(
          "Health Place",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          color: Color(0xFFFAFAFA),
          child: Column(
            children: <Widget>[
              CardProfile(),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text("Últimos Exames", style: TextStyle(fontSize: 20),),
              ),
              ExamsList(5)
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
