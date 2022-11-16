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
      backgroundColor: primaryColor,
      elevation: 0,
      title: Text(widget.titleText,
          style: GoogleFonts.nunito(
              fontSize: 30, fontWeight: FontWeight.bold, color: textColor)),
      centerTitle: true,
    );
  }
}
