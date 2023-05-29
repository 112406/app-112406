import 'package:get/get.dart';

import '../index.dart';

/// 用戶服務
class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  // final _profile = UserProfileModel().obs;

  /// 是否登錄
  bool get isLogin => _isLogin.value;

  /// 用戶 profile
  // UserProfileModel get profile => _profile.value;

  /// 是否有令牌 token
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // 讀 token
    token = Storage().getString(Constants.storageToken);
    // 讀 profile
    // var profileOffline = Storage().getString(Constants.storageProfile);
    // if (profileOffline.isNotEmpty) {
    //   _profile(UserProfileModel.fromJson(jsonDecode(profileOffline)));
    // }
  }

  /// 設置令牌
  Future<void> setToken(String value) async {
    await Storage().setString(Constants.storageToken, value);
    token = value;
  }

  /// 獲取用戶 profile
  // Future<void> getProfile() async {
  //   if (token.isEmpty) return;
  //   UserProfileModel result = await UserApi.profile();
  //   _profile(result);
  //   _isLogin.value = true;
  //   Storage().setString(Constants.storageProfile, jsonEncode(result));
  // }

  /// 設置用戶 profile
  // Future<void> setProfile(UserProfileModel profile) async {
  //   if (token.isEmpty) return;
  //   _isLogin.value = true;
  //   _profile(profile);
  //   Storage().setString(Constants.storageProfile, jsonEncode(profile));
  // }

  /// 註銷
  // Future<void> logout() async {
  //   // if (_isLogin.value) await UserAPIs.logout();
  //   await Storage().remove(Constants.storageToken);
  //   _profile(UserProfileModel());
  //   _isLogin.value = false;
  //   token = '';
  // }

  /// 檢查是否登錄
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.systemLogin);
      return false;
    }
    return true;
  }
}
