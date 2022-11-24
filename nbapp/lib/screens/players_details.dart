import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../models/players.models.dart';
import '../providers/players.provider.dart';
import '../services/players.dart';

class PlayersDetails extends StatefulWidget {
  PlayersDetails({super.key, required this.index, required this.keys});

  int index;
  String keys;

  @override
  State<PlayersDetails> createState() => _PlayersDetailsState();
}

class _PlayersDetailsState extends State<PlayersDetails> {
  List<PlayersModel>? _players = [];

  bool _isloading = true;

  @override
  void initState() {
    getPlayers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPlayers() async {
    var playersProvider = Provider.of<PlayersProvider>(context, listen: false);
    final players = await PlayersApi.getPlayers(widget.keys);
    playersProvider.setPlayersList(players);

    setState(() {
      _players = players;
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List splitDateAndTime(String dateTime) {
      List dateAndTime = dateTime.split('T');

      return dateAndTime;
    }

    PlayersProvider playersProvider =
        Provider.of<PlayersProvider>(context, listen: false);

    return Consumer<PlayersProvider>(builder: (context, value, child) {
      if (playersProvider.players.isNotEmpty) {
        return Scaffold(
            appBar: AppBar(
              elevation: 1,
              toolbarHeight: 50,
              centerTitle: true,
              flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)))),
              title: Center(
                child: Row(children: [
                  Text(
                      '${playersProvider.getPlayersByIndex(widget.index).firstname} ${playersProvider.getPlayersByIndex(widget.index).lastname}',
                      style: GoogleFonts.aBeeZee(fontSize: 20))
                ]),
              ),
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
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/logo-NBA.png'))),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(
                                      '${playersProvider.getPlayersByIndex(widget.index).photo}'))),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text('Players informations',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Firstname: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).firstname}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Lastname: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).lastname}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Team: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).team}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Jersey: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).jersey}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Position: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).position}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Height: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).height}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Weight: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).weight}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Birthdate: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${splitDateAndTime(playersProvider.getPlayersByIndex(widget.index).birthdate!)[0]}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('College: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).college}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Salary: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).salary}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('Experience: ',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  '${playersProvider.getPlayersByIndex(widget.index).experience}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    )
                  ]),
            ));
      }
      return const Center(
        child: Text("Server Error"),
      );
    });
  }
}
