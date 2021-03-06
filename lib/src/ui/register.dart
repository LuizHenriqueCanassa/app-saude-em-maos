import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _clearValidation() {
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _loginPage();
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Color(0xFF1DE9B6),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 0, left: 40, right: 40, bottom: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("images/stethoscope.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "CPF",
                                  icon: Icon(Icons.person),
                                  hoverColor: Colors.green,
                                  fillColor: Colors.green),
                              controller: _cpfController,
                              keyboardType: TextInputType.number,
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "O campo é obrigatório!";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Senha",
                                  icon: Icon(Icons.lock),
                                  hoverColor: Colors.green,
                                  fillColor: Colors.green),
                              controller: _passwordController,
                              obscureText: true,
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "O campo obrigatório!";
                                } else if (text.length < 6) {
                                  return "O campo deve conter no mínimo 10 caracteres!";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FlatButton(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _clearValidation();
                                }
                              },
                              color: Color(0xFF1DE9B6),
                              child: Text(
                                "Registrar",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginPage(){
    Navigator.pop(context);
  }
}
