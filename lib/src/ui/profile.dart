import 'package:appsaudeemmaos/src/widgets/bottom_navigation_widget.dart';
import 'package:appsaudeemmaos/src/widgets/drawer_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/employee.png"),
                      )
                  ),
                ),
                onTap: (){},
              ),
              SizedBox(height: 30,),
              Container(
                child: Form(
                  child: Column(),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomNavigation(context),
    );
  }
}

