import '../index.dart';

/// 用戶 api
class UserApi {
  /// 註冊
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/signup',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
