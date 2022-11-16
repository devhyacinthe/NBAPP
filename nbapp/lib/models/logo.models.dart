class LogoModel {
  final String? logo;
  final String? city;
  final String? name;
  final String? color;
  final int? teamID;

  LogoModel(
      {required this.logo,
      required this.city,
      required this.name,
      required this.color,
      required this.teamID});

  factory LogoModel.fromJson(dynamic json) {
    return LogoModel(
        logo: json['WikipediaLogoUrl'] as String?,
        city: json['City'] as String,
        name: json['Name'] as String,
        color: json['PrimaryColor'] as String,
        teamID:json['TeamID'] as int,
        );
        
  }

  static List<LogoModel> logoModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return LogoModel.fromJson(data);
    }).toList();
  }
}
