// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:html/parser.dart';

void main() async {
  // testWidgets(description,response = await DioFactory().getData();
  final dio = Dio();

  // const baseUrl = 'https://heho.com.tw/archives/category/health-care';
  const baseUrl = 'https://heho.com.tw/archives/305610';
  Response response = await dio.get(baseUrl);
  // print(response);
  var document = parse(response.data);
  // print(document);
  // var content = document
  //     .querySelector('div.row.large-columns-1.medium-columns-.small-columns-1');
  // var postItems = content?.querySelectorAll('div.col.post-item');
  // // print(content);
  // // print(postItems);
  // var article = postItems?[0]
  //     .querySelector('.image-cover>a')
  //     ?.attributes['href']; // article link
  // var img = postItems?[0]
  //     .querySelector('.image-cover>a>img')
  //     ?.attributes['data-src']; // article image
  // var title = postItems?[0]
  //     .querySelector('.image-cover>a.plain')
  //     ?.attributes['aria-label']; // article title
  // var author = postItems?[0]
  //     .querySelector('.box-text-inner.blog-post-inner>p'); // author and date
  // var desc = postItems?[0]
  //     .querySelectorAll('.box-text-inner.blog-post-inner>p')[1]
  //     .text; // article description
  // print(desc);

  var content = document.querySelector('div.entry-content.single-page');
  // var post = content?.querySelectorAll('figure').length;
  // var post = content?.querySelectorAll('figure>img')[1].attributes['data-src'];
  // var postItems = content?.querySelectorAll('h2,p,figure');
  var postItems = content?.querySelectorAll('p')[0].text;
  List<String> post = [];
  // var postItem = content?.querySelectorAll('p')[2].text;
  print(postItems);
  // print(postItems![5].localName);
  // // if (postItems![5].localName == 'h2') {
  // //   print('aaa');
  // // }
  // for(int i = 0; i < postItems.length; i++){

  //   if(postItems[i].localName == 'h2'){
  //     post.add(postItems[i].text);
  //   }else if(postItems[i].localName == 'p'){
  //     post.add(postItems[i].text);
  //   }else if(postItems[i].localName == 'figure'){
  //     post.add(postItems[i].querySelector('img')?.attributes['data-src'] ?? '');
  //   }
  // }
  print(post);

  int i = 0;
  print('aaa');
  // for (var item in postItems!) {
  //   postItems[i].querySelector('.image-cover')?.attributes['href'];
  //   print(postItems[i].querySelector('.image-cover>a')?.attributes['href']);
  //   // news.add(NewsModel(title: title!, link: link, image: image, date: date, description: description));
  //   i++;
  // }
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
