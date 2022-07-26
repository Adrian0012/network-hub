import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class ChannelIndexScreen extends StatefulWidget {
  const ChannelIndexScreen({Key? key}) : super(key: key);

  @override
  State<ChannelIndexScreen> createState() => _ChannelIndexScreenState();
}

class _ChannelIndexScreenState extends State<ChannelIndexScreen> {
  final int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Chats Screen'),
          backgroundColor: Colors.purpleAccent),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.wechat_sharp),
                label: 'Chat Rooms',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: (index) {
            if (index == 1) {
              Beamer.of(context).beamToNamed(Routes.index);
            }
          },
          elevation: 5),
    );
  }
}
