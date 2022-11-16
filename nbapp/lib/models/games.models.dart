class GamesModel {
  final String? dateTime;
  final String? awayTeam;
  final String? homeTeam;
  final String? channel;
  final int? awayTeamScore;
  final int? homeTeamScore;
  final String? quarter;
  final int? timeRemainingMinutes;
  final int? timeRemainingSeconds;
  final int awayTeamID;
  final int homeTeamID;

  GamesModel(
      {required this.dateTime,
      required this.awayTeam,
      required this.homeTeam,
      required this.channel,
      required this.awayTeamScore,
      required this.homeTeamScore,
      required this.timeRemainingMinutes,
      required this.quarter,
      required this.awayTeamID,
      required this.homeTeamID, 
      required this.timeRemainingSeconds});

  factory GamesModel.fromJson(dynamic json) {
    return GamesModel(
      dateTime: json['DateTimeUTC'] as String,
      awayTeam: json['AwayTeam'] as String,
      homeTeam: json['HomeTeam'] as String,
      channel: json['Channel'] as String,
      awayTeamScore: json['AwayTeamScore'] as int?,
      homeTeamScore: json['HomeTeamScore'] as int?,
      quarter: json['Quarter'] as String?,
      timeRemainingMinutes: json['TimeRemainingMinutes'] as int?,
      timeRemainingSeconds: json['TimeRemainingSeconds'] as int?,
      awayTeamID: json['AwayTeamID'] as int,
      homeTeamID: json['HomeTeamID'] as int,
    );
  }

  static List<GamesModel> gamesModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return GamesModel.fromJson(data);
    }).toList();
  }
}
