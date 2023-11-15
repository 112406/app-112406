import 'package:dio/dio.dart';

class DioFactory {
  final dio = Dio();
  static const baseUrl = 'https://heho.com.tw/archives/category/health-care';
  Future<String> getData() async {
    try {
      Response response = await dio.get(baseUrl);
      // print(response);
      return response.data.toString();
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> getArticle(String url) async {
    try {
      Response response = await dio.get(url);
      // print(response);
      return response.data.toString();
    } catch (e) {
      print(e);
      return '';
    }
  }
}

class Config {
  /// 連結超時時間
  static const int connectTimeout = 8000;
  static const int receiveTimeout = 3000;

  ///普通格式的header
  static const Map<String, dynamic> headers = {
    "Accept": "application/json",
  };

  ///json格式的header
  static const Map<String, dynamic> headersJson = {
    "Accept": "application/json",
    "Content-Type": "application/json; charset=UTF-8",
  };
}
