import 'package:appsaudeemmaos/src/resources/login_repository.dart';
import 'package:appsaudeemmaos/src/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRepository repository = LoginRepository();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _clearValidation() {
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _submitForm() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _registerPage();
        },
        child: Icon(Icons.person_add),
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
                                  labelText: "Usuário",
                                  icon: Icon(Icons.person),
                                  hoverColor: Colors.green,
                                  fillColor: Colors.green),
                              controller: _usernameController,
                              keyboardType: TextInputType.text,
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
                                  _homePage();
                                }
                              },
                              color: Color(0xFF1DE9B6),
                              child: Text(
                                "Entrar",
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

  void _registerPage() {
    Navigator.pushNamed(context, '/register');
  }

  void _homePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
