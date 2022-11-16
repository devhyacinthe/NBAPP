import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/games.models.dart';
import '../models/logo.models.dart';

class GameByDateApi {
  static Future<List<GamesModel>> getGamesByDate() async {
    final DateTime now = DateTime.now();
    final later = now.subtract(const Duration(hours: 12));

    final DateFormat formatter = DateFormat('y-MMM-d');
    final String formatted = formatter.format(later);

    var uri = Uri.https('api.sportsdata.io',
        '/v3/nba/scores/json/GamesByDate/${formatted.toUpperCase()}');

    final response = await http.get(uri, headers: {
      "Ocp-Apim-Subscription-Key": "77e61c394d684c52a3ed7dec8f7d02cd"
    });

    List data = jsonDecode(response.body);

    List temp = [];
    for (var i = 0; i < data.length; i = i + 1) {
      temp.add(data[i]);
    }

    return GamesModel.gamesModelFromSnapshot(temp);
  }
}
