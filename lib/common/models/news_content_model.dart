class NewsContentModel {
  final String? title;
  final String? urlToImage;
  final String? paragraph;
  
  NewsContentModel({
    this.title,
    this.urlToImage,
    this.paragraph,
  });

  factory NewsContentModel.fromJson(Map<String, dynamic> json) {
    return NewsContentModel(
      title: json['title'],
      urlToImage: json['urlToImage'],
      paragraph: json['paragraph'],
    );
  }
}