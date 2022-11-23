class NewsModel {
  final String? team;
  final String? source;
  final String? timeAgo;
  final String? title;
  final String? content;
  final String? link;
  final String? author;

  NewsModel({
    required this.team,
    required this.source,
    required this.timeAgo,
    required this.title,
    required this.content,
    required this.author,
    required this.link,
  });

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
      team: json['Team'] as String,
      source: json['Source'] as String,
      timeAgo: json['TimeAgo'] as String,
      content: json['Content'] as String,
      author: json['Author'] as String,
      link: json['Url'] as String,
      title: json['Title'] as String,
    );
  }

  static List<NewsModel> newsModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return NewsModel.fromJson(data);
    }).toList();
  }
}
