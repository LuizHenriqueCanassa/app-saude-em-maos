import 'package:appsaudeemmaos/src/ui/exams.dart';
import 'package:appsaudeemmaos/src/ui/home.dart';
import 'package:appsaudeemmaos/src/ui/login.dart';
import 'package:appsaudeemmaos/src/ui/profile.dart';
import 'package:appsaudeemmaos/src/ui/register.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Health Place",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1DE9B6),
        accentColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.white),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
        '/exams': (context) => ExamsScreen()
      },
    );
  }
}
