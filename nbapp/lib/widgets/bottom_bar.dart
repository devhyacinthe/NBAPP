import 'package:flutter/material.dart';
import 'package:nbapp/constants/colors.dart';

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
        Navigator.pushNamed(context, '/teams');
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/news');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq_outlined), label: "Teams"),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball_outlined), label: "Games"),
        BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined), label: "News"),
      ],
      currentIndex: _selectedIndex,
      elevation: 2,
      backgroundColor: primaryColor,
      selectedItemColor: secondaryColor,
      onTap: _onTapped,
      selectedLabelStyle: const TextStyle(color: secondaryColor),
      unselectedLabelStyle: const TextStyle(color: textColor),
    );
  }
}
