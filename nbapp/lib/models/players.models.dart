class PlayersModel {
  final int? teamID;
  final String? team;
  final int? jersey;
  final String? position;
  final String? firstname;
  final String? lastname;
  final int? height;
  final int? weight;
  final String? birthdate;
  final String? college;
  final String? photo;
  final int? salary;
  final int? experience;

  PlayersModel({
    required this.teamID,
    required this.team,
    required this.jersey,
    required this.position,
    required this.firstname,
    required this.lastname,
    required this.height,
    required this.weight,
    required this.birthdate,
    required this.college,
    required this.photo,
    required this.salary,
    required this.experience,
  });

  factory PlayersModel.fromJson(dynamic json) {
    return PlayersModel(
    teamID: json['TeamID'] as int?,
    team: json['Team'] as String,
    jersey: json['Jersey'] as int,
    position: json['Position'] as String,
    firstname: json['FirstName'] as String?,
    lastname: json['LastName'] as String?,
    height: json['Height'] as int,
    weight: json['Weight'] as int,
    birthdate: json['BirthDate'] as String,
    college: json['College'] as String,
    photo: json['PhotoUrl'] as String,
    salary: json['Salary'] as int?,
    experience: json['Experience'] as int,
    );
  }

  static List<PlayersModel> playersModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return PlayersModel.fromJson(data);
    }).toList();
  }
}
