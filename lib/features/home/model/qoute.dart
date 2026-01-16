class Quote {
  final String id;
  final String text;
  final String author;
  final String category;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      author: json['author'],
      category: json['category'],
    );
  }
}
