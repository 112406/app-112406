import '../locale_keys.dart';

/// 多語言 英文
Map<String, String> localeJa = {
  // 通用
  LocaleKeys.commonSearchInput: 'キーワード検索',
  LocaleKeys.commonBottomSave: 'セーフ',
  LocaleKeys.commonBottomRemove: 'デリート',
  LocaleKeys.commonBottomCancel: 'キャンセル',
  LocaleKeys.commonBottomConfirm: '確認',
  LocaleKeys.commonBottomApply: 'アプリ',
  LocaleKeys.commonBottomBack: '戻る',
  LocaleKeys.commonSelectTips: '選んでください',
  LocaleKeys.commonMessageSuccess: '@method 成功',
  LocaleKeys.commonMessageIncorrect: '@method 間違います',

  // 樣式
  LocaleKeys.stylesTitle: 'スタイル && 機能 && 調整',

  // welcome 歡迎
  LocaleKeys.welcomeOneTitle: 'あなたの健康管理AIをパーソナライズする。',
  LocaleKeys.welcomeOneDesc: '健康目標をAIに実現する。',
  LocaleKeys.welcomeTwoTitle: 'AIフィットネストレーサー',
  LocaleKeys.welcomeTwoDesc: 'AIフィットネストレーサーを通して栄養とフィットネス目標を把握する。',
  LocaleKeys.welcomeThreeTitle: '共感ヘルシーAIチャットボットサービス',
  LocaleKeys.welcomeThreeDesc: '共感ヘルシーAIチャットボットを利用して、感情を活かしましょう。',
  LocaleKeys.welcomeSkip: 'スキップ',
  LocaleKeys.welcomeNext: '次ページ',
  LocaleKeys.welcomeStart: 'すぐに始める',

  // 登錄、註冊 - 通用
  LocaleKeys.loginForgotPassword: 'パスワードをお忘れですか?',
  LocaleKeys.loginSignIn: 'サインイン',
  LocaleKeys.loginSignUp: '新規登録',
  LocaleKeys.loginOrText: 'と',
  LocaleKeys.userName: 'ユーザーネーム',
  LocaleKeys.emailAddress: 'Eメール',
  LocaleKeys.password: 'パスワード',
  LocaleKeys.passwordconfirm: 'パスワード再確認',
  LocaleKeys.dontHaveAccount: 'アカウント持ってません?',
  LocaleKeys.alreadyHaveaccount: 'ご登録済みの方?',

  // 註冊 - register user
  LocaleKeys.registerTitle: 'こんにちは',
  LocaleKeys.registerDesc: '新規登録',
  LocaleKeys.loginTitle: 'サインイン',
  LocaleKeys.loginDesc: 'サインインであなただけの健康管理をAIに任せる。',
  LocaleKeys.confirmPolicy: 'お続きのがプライバシーと利用規約を同意ことに見られます。',
  LocaleKeys.registerFormName: 'アカウント',
  LocaleKeys.registerFormEmail: 'Eメール',
  LocaleKeys.registerFormPhoneNumber: '電話番号',
  LocaleKeys.registerFormPassword: 'パスワード',
  LocaleKeys.registerFormFirstName: '姓',
  LocaleKeys.registerFormLastName: '名',
  LocaleKeys.registerHaveAccount: '既にご登録いただいている?',

  // 驗證提示
  LocaleKeys.validatorRequired: '入力してください',
  LocaleKeys.validatorEmail: 'Eメールを入力してください',
  LocaleKeys.validatorMin: 'ワードを @size字以上してください',
  LocaleKeys.validatorMax: 'ワードを@size字以下してください',
  LocaleKeys.validatorPassword: 'パスワードを @min 字以上 @max字以下してください',
  LocaleKeys.validatorPasswordConfirm: 'パスワード違います',

  // home main page
  LocaleKeys.ghomeHelloUser: 'こんにちは， ',
  LocaleKeys.ghomeHealthTitle: 'AIヘルシー指標',
  LocaleKeys.ghomeFitnessTrackerTitle: 'AIフィットネストレーサー',
  LocaleKeys.ghomeWellnessChatbotTitle: 'AIヘルシーチャットボット',
  LocaleKeys.ghomeWellnessScoreTitle: 'ヘルシー点数',
  LocaleKeys.ghomeWellnessScoreDesc: 'ヘルシー点数はあなたの健康状態のまとめ点数。',

  // home func card
  LocaleKeys.ghomeFuncCardHeartRate: '心拍数',
  LocaleKeys.ghomeFuncCardHeartRateNumber: ' @heatrate',
  LocaleKeys.ghomeFuncCardHeartRateBPM: '回/分',
  LocaleKeys.ghomeFuncCardBloodPressure: '血圧',
  LocaleKeys.ghomeFuncCardBloodPressureSystolic: '収縮期血圧',
  LocaleKeys.ghomeFuncCardBloodPressureDiastolic: '拡張期血圧',
  LocaleKeys.ghomeFuncCardBloodPressureNumber: '@bloodpressure',
  LocaleKeys.ghomeFuncCardBloodPressureMMHG: 'mmHg',
  LocaleKeys.ghomeFuncCardSleep: '睡眠',
  LocaleKeys.ghomeFuncCardSleepNumber: '@sleep',
  LocaleKeys.ghomeFuncCardSleepHours: '時間',

  // home fitness tracker
  LocaleKeys.ghomeFitnessCaloriesTitle: 'カロリー',
  LocaleKeys.ghomeFitnessStepsTaken: '歩数',
  LocaleKeys.ghomeFitnessStepsTakenDesc: ' @steps 歩を歩いた',
  LocaleKeys.ghomeFitnessNutrition: '栄養',
  LocaleKeys.ghomeFitnessSleep: '睡眠',
  LocaleKeys.ghomeFitnessSleepDesc: ' @sleep 時間を寝ました',

  // setting my account
  LocaleKeys.settingMyAccountTitle: 'マイアカウント',
  LocaleKeys.settingGeneralTitle: '設定',
  LocaleKeys.settingGeneralPersonalInfo: '個人情報',
  LocaleKeys.settingGeneralNotification: 'アナウンサー',
  LocaleKeys.settingAccessibilityTitle: 'アクセシビリティ',
  LocaleKeys.settingAccessibilityLanguage: '日本語',
  LocaleKeys.settingAccessibilityDarkMode: 'ダークモード',

  // setting my account - personal information
  LocaleKeys.settingPersonalInfomationTitle: '個人情報',
  LocaleKeys.settingPersonalInfomationUserName: 'ユーザーネーム',
  LocaleKeys.settingPersonalInfomationHeight: '身長',
  LocaleKeys.settingPersonalInfomationWeight: '体重',
  LocaleKeys.settingPersonalInfomationDateOfBirth: '誕生日',

  // setting my account - sign out
  LocaleKeys.settingSignOutTitle: 'サインアウト',

  // wellness news page
  LocaleKeys.wellnessNewsTitle: 'ヘルシーニュース',
};
