import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbapp/constants/colors.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.team,
    required this.source,
    required this.timeAgo,
    required this.title,
    required this.content,
    required this.author,
    required this.link,
  }) : super(key: key);

  final String? team;
  final String? source;
  final String? timeAgo;
  final String? title;
  final String? content;
  final String? link;
  final String? author;

  void launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          borderOnForeground: true,
          elevation: 10,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.1,
                      image: AssetImage('assets/images/nba.png'))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width + 200,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(timeAgo!,
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Center(
                                child: Text(title!,
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 20, color: secondaryColor))),
                            const SizedBox(
                              height: 25,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(content!,
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: true)
                                  ]),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    'Voir Plus...',
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  onTap: () {
                                    launch(Uri.parse(link!));
                                  },
                                ),
                                Text(
                                  'Author: ${author!}',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        )),
                  ]),
            ),
          )),
    );
  }
}
