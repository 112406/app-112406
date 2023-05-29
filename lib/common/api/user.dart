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

  /// 登錄
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post(
      '/signin',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// Profile
  // static Future<UserProfileModel> profile() async {
  //   var res = await WPHttpService.to.get(
  //     '/users/me',
  //   );
  //   return UserProfileModel.fromJson(res.data);
  // }
}
