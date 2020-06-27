import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  final User user;

  const DrawerMenu({this.user});
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  void _navigateToPage(String route) {
    Navigator.pushNamed(context, route);
  }

  User user;
  @override
  void initState() {
    user = User.fromUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset("images/employee.png", height: 70, width: 70),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      user.name,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Home"),
            onTap: () {
              _navigateToPage("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Perfil"),
            onTap: () {
              _navigateToPage("/profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Exames"),
            onTap: () {
              _navigateToPage("/exams");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () {
              _navigateToPage("/login");
            },
          )
        ],
      ),
    );
  }
}
