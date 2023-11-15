import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/models/news_content_model.dart';
import 'package:html/parser.dart';

class NewsRepository {
  Future<List<NewsCoverModel>> fetchNewsCover() async {
    String response;
    List<NewsCoverModel> news = [];
    try {
      response = await DioFactory().getData();
      var document = parse(response);
      var content = document.querySelector(
          'div.row.large-columns-1.medium-columns-.small-columns-1');
      var postItems = content?.querySelectorAll('div.col.post-item');
      for (int i = 0; i < postItems!.length; i++) {
        NewsCoverModel newsItems = NewsCoverModel(
          title: postItems[i]
              .querySelector('.image-cover>a.plain')
              ?.attributes['aria-label'], //title
          description: postItems[i]
              .querySelectorAll('.box-text-inner.blog-post-inner>p')[1]
              .text, // article description
          url: postItems[i]
              .querySelector('.image-cover>a')
              ?.attributes['href'], //link
          urlToImage: postItems[i]
              .querySelector('.image-cover>a>img')
              ?.attributes['data-src'], // article image
          publishedAt: postItems[i]
              .querySelectorAll('.box-text-inner.blog-post-inner>p')[0]
              .text,
          // print();
          // content:
          //     postItems[0].querySelector('.box-text-inner.blog-post-inner>p')[0].text,
        );
        news.add(newsItems);
        // news.add(NewsModel(title: title!, link: link, image: image, date: date, description: description));
      }
      return news;
    } catch (e) {
      print(e);
    }
    return news;
  }

  Future<List<NewsContentModel>> fetchNewsContent(String url) async {
    String response;
    List<NewsContentModel> news = [];
    try {
      response = await DioFactory().getArticle(url);
      print(url);
      var document = parse(response);
      var content = document.querySelector('div.entry-content.single-page');
      var postItems = content?.querySelectorAll('h2,p,figure');
      for (int i = 0; i < postItems!.length; i++) {
        // NewsContentModel newsItems = NewsContentModel(

        //   title: postItems[i].text,
        //   paragraph: postItems[i].text,
        //   urlToImage: postItems[i].querySelector('img')?.attributes['data-src'] ?? '',
        // );
        if (postItems[i].localName == 'h2') {
          NewsContentModel newsItems = NewsContentModel(
            title: postItems[i].text,
            paragraph: null,
            urlToImage: null,
          );
          print(newsItems);
          news.add(newsItems);
        } else if (postItems[i].localName == 'p') {
          NewsContentModel newsItems = NewsContentModel(
            title: null,
            paragraph: postItems[i].text,
            urlToImage: null,
          );
          news.add(newsItems);
        } else if (postItems[i].localName == 'figure') {
          NewsContentModel newsItems = NewsContentModel(
            title: null,
            paragraph: null,
            urlToImage:
                postItems[i].querySelector('img')?.attributes['data-src'],
          );
          news.add(newsItems);
        }
      }
      return news;
    } catch (e) {
      print(e);
    }
    return news;
  }
}
