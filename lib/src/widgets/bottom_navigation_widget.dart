import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final BuildContext context;
  BottomNavigation(this.context);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  Route currentRoute;

  @override
  void initState() {
    Navigator.popUntil(widget.context, (route) {
      currentRoute = route;

      if(currentRoute.settings.name == '/' || currentRoute.settings.name == null){
        _selectedIndex = 0;
      }else if(currentRoute.settings.name == '/profile'){
        _selectedIndex = 1;
      }else if(currentRoute.settings.name == '/exams'){
        _selectedIndex = 2;
      }

      return true;
    });
    super.initState();
  }

  void _switchPage(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index){
        case 0:
          Navigator.pushNamed(context, "/");
          break;
        case 1:
          Navigator.pushNamed(context, "/profile");
          break;
        case 2:
          Navigator.pushNamed(context, "/exams");
          break;
        case 3:
          Navigator.pushNamed(context, "/login");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text("Perfil")),
        BottomNavigationBarItem(
            icon: Icon(Icons.description), title: Text("Exames")),
        BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app), title: Text("Sair"))
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: _switchPage,
    );
  }
}
