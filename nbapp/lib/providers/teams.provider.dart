import 'package:flutter/material.dart';

import '../models/teams.models.dart';


class TeamsProvider extends ChangeNotifier {
  List<TeamsModel> _teams = [];
  final bool _isloading = true;

  bool get isloading => _isloading;
  List<TeamsModel> get teams => _teams;
 

  

  void setTeamsList(List<TeamsModel> teams) {
    _teams = teams;
    notifyListeners();
  }


  TeamsModel getTeamsByIndex(int index) {
    return _teams[index];
  }
}
