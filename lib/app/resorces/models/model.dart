class Article {
  final String id;
  final String title;
  final String description;
  final String body;

  Article({this.id, this.title, this.description, this.body});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      body: json['body'],
    );
  }
}