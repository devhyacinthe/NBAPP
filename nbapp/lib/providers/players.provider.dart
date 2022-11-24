import 'package:flutter/material.dart';

import '../models/players.models.dart';

class PlayersProvider extends ChangeNotifier {
  List<PlayersModel> _players = [];
  final bool _isloading = true;

  bool get isloading => _isloading;
  List<PlayersModel> get players => _players;
 

  

  void setPlayersList(List<PlayersModel> players) {
    _players = players;
    notifyListeners();
  }


  PlayersModel getPlayersByIndex(int index) {
    return _players[index];
  }


}
