import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbapp/constants/colors.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, required this.titleText}) : super(key: key);

  final String titleText;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_outlined)),
      ],
      backgroundColor: Colors.white,
      leading: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/nba-logo-transparent.png')))),
      elevation: 0.5,
      toolbarHeight: 50,
      title: Text(widget.titleText,
          style: GoogleFonts.archivo(
              letterSpacing: 2,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: textColor)),
      centerTitle: true,
      flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)))),
    );
  }
}
