import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/routers/observers.dart';
import 'package:healthcare_app/pages/system/main/binding.dart';

import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  // 列表
  // static List<GetPage> list = [];

  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<GetPage> list = [
    // app 首頁
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
        name: RouteNames.homeBloodPressureDiastolic,
        page: () => const BloodPressureDiastolicPage(),
      ),
      GetPage(
        name: RouteNames.homeBloodPressureSystolic,
        page: () => const BloodPressureSystolicPage(),
      ),
    GetPage(
      name: RouteNames.homeBloodPressure,
      page: () => const BloodPressurePage(),
    ),
    GetPage(
      name: RouteNames.homeHeartRate,
      page: () => const HeartRatePage(),
    ),
    GetPage(
      name: RouteNames.homeHomeIndex,
      page: () => const HomeIndexPage(),
    ),
    GetPage(
      name: RouteNames.homeSleepTracker,
      page: () => const SleepTrackerPage(),
    ),
    GetPage(
      name: RouteNames.settingsMyAccount,
      page: () => const MyAccountPage(),
    ),
    GetPage(
      name: RouteNames.settingsNotification,
      page: () => const NotificationPage(),
    ),
     GetPage(
        name: RouteNames.settingsLanguage,
        page: () => const LanguagePage(),
      ),
    GetPage(
      name: RouteNames.settingsPersonalInfomation,
      page: () => const PersonalInfomationPage(),
    ),
    GetPage(
      name: RouteNames.settingsSecurity,
      page: () => const SecurityPage(),
    ),
    GetPage(
      name: RouteNames.settingsSettingsIndex,
      page: () => const SettingsIndexPage(),
    ),
    GetPage(
      name: RouteNames.stylesBottomSheet,
      page: () => const BottomSheetPage(),
    ),
    GetPage(
      name: RouteNames.stylesButtons,
      page: () => const ButtonsPage(),
    ),
    GetPage(
      name: RouteNames.stylesCarousel,
      page: () => const CarouselPage(),
    ),
    GetPage(
      name: RouteNames.stylesComponents,
      page: () => const ComponentsPage(),
    ),
    GetPage(
      name: RouteNames.stylesGroupList,
      page: () => const GroupListPage(),
    ),
    GetPage(
      name: RouteNames.stylesIcon,
      page: () => const IconPage(),
    ),
    GetPage(
      name: RouteNames.stylesImage,
      page: () => const ImagePage(),
    ),
    GetPage(
      name: RouteNames.stylesInputs,
      page: () => const InputsPage(),
    ),
    GetPage(
      name: RouteNames.stylesOther,
      page: () => const OtherPage(),
    ),
    GetPage(
      name: RouteNames.stylesStylesIndex,
      page: () => const StylesIndexPage(),
    ),
    GetPage(
      name: RouteNames.stylesText,
      page: () => const TextPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextForm,
      page: () => const TextFormPage(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
    ),
    GetPage(
      name: RouteNames.systemSignin,
      page: () => const SigninPage(),
    ),
    GetPage(
      name: RouteNames.systemSignup,
      page: () => const SignupPage(),
    ),
    GetPage(
        name: RouteNames.systemForgotPassword,
        page: () => const ForgotPasswordPage(),
      ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemWelcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.trackerTaskAdd,
      page: () => const TaskAddPage(),
    ),
    GetPage(
      name: RouteNames.trackerTrackerIndex,
      page: () => const TrackerIndexPage(),
    ),
    GetPage(
      name: RouteNames.wellnessWellnessContent,
      page: () => const WellnessContentPage(),
    ),
    GetPage(
      name: RouteNames.wellnessWellnessIndex,
      page: () => const WellnessIndexPage(),
    ),
  ];
}
