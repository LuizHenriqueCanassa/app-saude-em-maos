import 'package:appsaudeemmaos/src/widgets/bottom_navigation_widget.dart';
import 'package:appsaudeemmaos/src/widgets/drawer_menu_widget.dart';
import 'package:appsaudeemmaos/src/widgets/profile_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProfileDataWidget();
  }
}

