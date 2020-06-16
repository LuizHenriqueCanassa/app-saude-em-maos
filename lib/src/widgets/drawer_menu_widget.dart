import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("ola"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
