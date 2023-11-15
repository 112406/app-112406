class NewsCoverModel {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  // final String? content;

  NewsCoverModel({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    // this.content,
  });

  factory NewsCoverModel.fromJson(Map<String, dynamic> json) {
    return NewsCoverModel(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      // content: json['content'],
    );
  }
}
