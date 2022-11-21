import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nbapp/constants/colors.dart';
import 'package:nbapp/screens/newsPage.screen.dart';

import '../screens/teamsPage.screen.dart';

class BottomBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const BottomBarCustom({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {
  int _selectedIndex = 1;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Get.to(() => const TeamsPage(), transition: Transition.zoom);
      } else if (_selectedIndex == 2) {
        Get.to(() => const NewsPage(), transition: Transition.zoom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq_outlined), label: "Teams"),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball_outlined), label: "Games"),
        BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined), label: "News"),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: secondaryColor,
      onTap: _onTapped,
      selectedLabelStyle: const TextStyle(color: secondaryColor),
      unselectedLabelStyle: const TextStyle(color: textColor),
    );
  }
}
