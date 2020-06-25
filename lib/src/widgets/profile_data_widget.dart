import 'package:flutter/material.dart';

import 'drawer_menu_widget.dart';

class ProfileDataWidget extends StatefulWidget {
  @override
  _ProfileDataWidgetState createState() => _ProfileDataWidgetState();
}

class _ProfileDataWidgetState extends State<ProfileDataWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1DE9B6),
          title: Text(
            "Health Place - Perfil",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(text: "Dados Pessoais",),
              Tab(text: "Endereço",)
            ],
          ),
        ),
        body: Container(),
        drawer: DrawerMenu(),
      ),
    );
  }
}
