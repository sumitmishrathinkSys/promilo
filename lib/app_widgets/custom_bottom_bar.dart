import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  CustomBottomBar({required this.selectedIndex, required this.onTap});

  final List<BottomBarItem> bottomBarItems = [
   const BottomBarItem(
      icon:  Icon(Icons.home),
      title:  Text('Home'),
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
    ),
   const BottomBarItem(
      icon:  Icon(Icons.window_sharp),
      title:  Text('Protlet'),
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
    ),
   const BottomBarItem(
      icon:  Icon(Icons.handshake_rounded),
      title:  Text('Meetups'),
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
    ),
    const BottomBarItem(
      icon:  Icon(Icons.folder_open_outlined),
      title:  Text('Explore'),
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
    ),
    const BottomBarItem(
      icon:  Icon(Icons.person),
      title:  Text('Accounts'),
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      selectedIndex: selectedIndex,
      items: bottomBarItems,
      onTap: onTap,
    );
  }
}
