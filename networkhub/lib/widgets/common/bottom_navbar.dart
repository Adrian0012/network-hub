import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_rounded),
              label: 'Stats',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_rounded),
            label: 'Account',
            backgroundColor: Colors.green,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: (index) {
          if (index == 0) {
            Beamer.of(context).beamToNamed(Routes.stats);
          } else if (index == 1) {
            Beamer.of(context).beamToNamed(Routes.dashboard);
          } else if (index == 2) {
            Beamer.of(context).beamToNamed(Routes.account);
          }
        },
        elevation: 5);
  }
}
