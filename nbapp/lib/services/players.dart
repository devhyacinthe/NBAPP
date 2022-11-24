import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/players.models.dart';

class PlayersApi {
  static Future<List<PlayersModel>> getPlayers(String key) async {
    

    var uri = Uri.https('api.sportsdata.io',
        '/v3/nba/scores/json/Players/${key}');

    final response = await http.get(uri, headers: {
      "Ocp-Apim-Subscription-Key": "77e61c394d684c52a3ed7dec8f7d02cd"
    });

    List data = jsonDecode(response.body);

    List temp = [];
    for (var i = 0; i < data.length; i = i + 1) {
      temp.add(data[i]);
    }

    return PlayersModel.playersModelFromSnapshot(temp);
  }
}
