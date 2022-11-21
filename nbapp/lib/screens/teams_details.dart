import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nbapp/providers/teams.provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


import '../constants/logo.dart';


// ignore: must_be_immutable
class TeamsDetails extends StatefulWidget {
  TeamsDetails({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  State<TeamsDetails> createState() => _TeamsDetailsState();
}

class _TeamsDetailsState extends State<TeamsDetails> {
  @override
  Widget build(BuildContext context) {
    TeamsProvider teamsProvider =
        Provider.of<TeamsProvider>(context, listen: false);

    return Consumer<TeamsProvider>(
      builder: (context, value, child) {
        if (teamsProvider.teams.isNotEmpty) {
          return Scaffold(
              appBar: AppBar(
                elevation: 1,
                toolbarHeight: 50,
                centerTitle: true,
                title: Text('${teamsProvider.getTeamsByIndex(widget.index).name}',
                    style: GoogleFonts.aBeeZee(fontSize: 32)),
                leading: GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    Get.back();
                  },
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(Icons.logout_outlined)),
                ],
              ),
              body: Container(
                  width: 400,
                  height: 250,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          opacity: .8,
                          image: AssetImage('assets/images/nba.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90))),
                  child: Center(
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('${logos[widget.index]}'),
                        )),
                 )));
        }
        return const Center(
          child: Text("Server Error"),
        );
      },
    );
  }
}
