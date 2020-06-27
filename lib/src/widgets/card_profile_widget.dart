import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProfile extends StatefulWidget {
  final User user;

  const CardProfile({this.user});
  @override
  _CardProfileState createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile> {
  User user;
  @override
  void initState() {
    user = User.fromUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 15, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/employee.png", height: 125, width: 125),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 30, top: 30),
                          title: Text("Bem Vindo!"),
                          subtitle: Text(user.name),
                        ),
                        ButtonBar(
                          buttonPadding: EdgeInsets.all(0),
                          children: <Widget>[
                            FlatButton(
                              child: Text("EDITAR PERFIL"),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/profile'),
                            ),
                            FlatButton(
                              child: Text("SAIR"),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
