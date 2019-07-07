class imed {
  final int id;
  final String title;
  final String description;

  final String sourceUrl;

  final String image;

  imed({
    this.id,
    this.title,
    this.description,
    this.sourceUrl,
    this.image,
  });

  factory imed.fromJson(Map<String, dynamic> json) {
    return imed(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      sourceUrl: json['sourceUrl'],
      image: json['image'],
    );
  }
}
