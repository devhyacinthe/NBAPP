
class TeamsModel {
  final int? teamID;
  final String? city;
  final String? name;
  final String? logo;
  final String? conference;
  final String? division;
  final String? key;
  final String? color;

  TeamsModel({
    required this.teamID,
    required this.city,
    required this.name,
    required this.logo,
    required this.key,
    required this.conference,
    required this.division,
    required this.color
  });

  factory TeamsModel.fromJson(dynamic json) {
    return TeamsModel(
      teamID: json['TeamID'] as int,
      city: json['City'] as String,
      name: json['Name'] as String,
      logo: json['WikipediaLogoUrl'] as String,
      conference: json['Conference'] as String,
      division: json['Division'] as String,
      color: json['SecondaryColor'] as String,
      key: json['Key'] as String,
    );
  }

  static List<TeamsModel> teamsModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return TeamsModel.fromJson(data);
    }).toList();
  }
}
