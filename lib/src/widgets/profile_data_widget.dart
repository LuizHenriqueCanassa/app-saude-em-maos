import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:appsaudeemmaos/src/utils/data_util.dart';
import 'package:flutter/material.dart';

import 'drawer_menu_widget.dart';

class ProfileDataWidget extends StatefulWidget {
  @override
  _ProfileDataWidgetState createState() => _ProfileDataWidgetState();
}

class _ProfileDataWidgetState extends State<ProfileDataWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formAddressKey = GlobalKey<FormState>();

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
              Tab(
                text: "Dados Pessoais",
              ),
              Tab(
                text: "Endereço",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("images/employee.png"))),
                        ),
                      ),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: User.name,
                                readOnly: true,
                                decoration: InputDecoration(
                                    labelText: "Nome",
                                    fillColor: Theme.of(context).primaryColor,
                                    hoverColor: Theme.of(context).primaryColor),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 5),
                                      child: TextFormField(
                                        initialValue: User.cpf,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            labelText: "CPF",
                                            fillColor:
                                                Theme.of(context).primaryColor,
                                            hoverColor:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: TextFormField(
                                        initialValue:
                                            DataUtil.formatData(User.birthDate),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            labelText: "Data de Nascimento",
                                            fillColor:
                                                Theme.of(context).primaryColor,
                                            hoverColor:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 5),
                                      child: TextFormField(
                                        initialValue: User.insuranceNumber,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            labelText: "Plano",
                                            fillColor:
                                                Theme.of(context).primaryColor,
                                            hoverColor:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: TextFormField(
                                        initialValue: User.phone,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            labelText: "Telefone",
                                            fillColor:
                                                Theme.of(context).primaryColor,
                                            hoverColor:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      child: Form(
                        key: _formAddressKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                      padding: EdgeInsets.only(right: 5),
                                      child: TextFormField(
                                        initialValue: User.address.city,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            labelText: "Cidade",
                                            fillColor:
                                                Theme.of(context).primaryColor,
                                            hoverColor:
                                                Theme.of(context).primaryColor),
                                      )),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: TextFormField(
                                      initialValue: User.address.state,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          labelText: "Estado",
                                          fillColor:
                                              Theme.of(context).primaryColor,
                                          hoverColor:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                      padding: EdgeInsets.only(right: 5),
                                      child: TextFormField(
                                        initialValue: User.address.street,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            labelText: "Rua",
                                            fillColor:
                                                Theme.of(context).primaryColor,
                                            hoverColor:
                                                Theme.of(context).primaryColor),
                                      )),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: TextFormField(
                                      initialValue: User.address.number,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          labelText: "Numero",
                                          fillColor:
                                              Theme.of(context).primaryColor,
                                          hoverColor:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            TextFormField(
                              initialValue: User.address.complement,
                              readOnly: true,
                              decoration: InputDecoration(
                                  labelText: "Complemento",
                                  fillColor: Theme.of(context).primaryColor,
                                  hoverColor: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        drawer: DrawerMenu(),
      ),
    );
  }
}
