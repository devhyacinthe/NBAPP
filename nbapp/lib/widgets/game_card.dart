import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbapp/constants/colors.dart';

class GameCard extends StatefulWidget {
  final String? dateTime;
  final String? awayTeam;
  final String? homeTeam;
  final String? channel;
  final int? awayTeamScore;
  final int? homeTeamScore;
  final String? quarter;
  final int? timeRemainingMinutes;
  final int? timeRemainingSeconds;

  const GameCard(
      {Key? key,
      required this.dateTime,
      required this.awayTeam,
      required this.homeTeam,
      required this.channel,
      required this.awayTeamScore,
      required this.homeTeamScore,
      required this.timeRemainingMinutes,
      required this.quarter,
      required this.timeRemainingSeconds})
      : super(key: key);

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  List splitDateAndTime(String dateTime) {
    List dateAndTime = dateTime.split('T');

    return dateAndTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Card(
          borderOnForeground: true,
          elevation: 5,
          color: Colors.white,
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.2,
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                      image: AssetImage('assets/images/nba.png'))),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: SizedBox(
                    width: 290,
                    height: 150,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(splitDateAndTime(widget.dateTime!)[0],
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 18, color: textColor))),
                              Text(splitDateAndTime(widget.dateTime!)[1],
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 18, color: textColor))),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      widget.quarter == null
                                          ? "None"
                                          : 'QT${widget.quarter!}',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 18, color: textColor))),
                                  Text(
                                      widget.timeRemainingMinutes == null
                                          ? "00:00"
                                          : '${widget.timeRemainingMinutes!}:${widget.timeRemainingSeconds!}',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 18, color: textColor)))
                                ],
                              )
                            ]),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.homeTeam!,
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                              fontSize: 35,
                                              color: Colors.black87,
                                              letterSpacing: 2))),
                                  const SizedBox(width: 15),
                                  Text(
                                      widget.homeTeamScore == null
                                          ? "0"
                                          : widget.homeTeamScore!.toString(),
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 30, color: textColor))),
                                  const SizedBox(width: 15),
                                  Text("VS",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 18, color: textColor))),
                                  const SizedBox(width: 15),
                                  Text(
                                      widget.awayTeamScore == null
                                          ? "0"
                                          : widget.awayTeamScore!.toString(),
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 30, color: textColor))),
                                  const SizedBox(width: 15),
                                  Text(widget.awayTeam!,
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                              fontSize: 35,
                                              color: Colors.black87)))
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                      ],
                    )),
              )),
        ),
      ),
    );
  }
}
