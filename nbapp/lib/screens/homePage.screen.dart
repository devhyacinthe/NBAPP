
import 'package:flutter/material.dart';
import 'package:nbapp/widgets/app_bar.dart';
import 'package:nbapp/widgets/bottom_bar.dart';

import '../models/games.models.dart';
import '../services/gamebydate.dart';
import '../widgets/game_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  List<GamesModel> _games = [];

  bool _isloading = true;

  @override
  void initState() {
    getGames();

    super.initState();
  }

  Future<void> getGames() async {
    _games = await GameByDateApi.getGamesByDate();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(titleText: 'Games'),
        bottomNavigationBar: const BottomBarCustom(),
        body: _isloading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: getGames,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/nba2.png'),
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat)),
                  child: ListView.builder(
                      itemCount: _games.length,
                      itemBuilder: (((context, index) {
                        return GameCard(
                          dateTime: _games[index].dateTime,
                          awayTeam: _games[index].awayTeam,
                          homeTeam: _games[index].homeTeam,
                          channel: _games[index].channel,
                          awayTeamScore: _games[index].awayTeamScore,
                          homeTeamScore: _games[index].homeTeamScore,
                          quarter: _games[index].quarter,
                          timeRemainingMinutes:
                              _games[index].timeRemainingMinutes,
                          timeRemainingSeconds:
                              _games[index].timeRemainingSeconds,
                        );
                      }))),
                ),
              ));
  }
}
