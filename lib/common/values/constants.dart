/// 常量
class Constants {
  // wp 服務器
  static const wpApiBaseUrl = 'http://192.168.1.150:8080';

  // 本地儲存key
  static const storageLanguageCode = 'language_code';
  static const storageThemeCode = 'theme_code';
  static const storageToken = 'token'; // 登錄成功後 token
  static const storageProfile = 'profile'; // 用戶資料緩存

  // 首次打開
  static const storageAlreadyOpen = 'already_open';

  // AES
  static const aesKey = 'aH5aH5bG0dC6aA3oN0cK4aU5jU6aK2lN';
  static const aesIV = 'hK6eB4aE1aF3gH5q';
}
