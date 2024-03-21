import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_app/Widgets/more_category.dart';
// import 'package:my_app/screens/home_screen.dart';
// import 'package:my_app/screens/wheretogo.dart';
// import 'package:my_app/syrus/home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Text("BeAHost"),
    const Text("BeAHost"),
    const Text("BeAHost"),
    const Text("BeAHost"),
    const Text("BeAHost"),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_backspace_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
              label: "MyTrips"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_backspace_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
              label: "Where2Go"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
              label: "TripMoney"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
              label: "BeAHost"),
        ],
      ),
    );
  }
}
