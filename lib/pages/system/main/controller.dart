import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

class MainController extends GetxController {
  MainController();

  _initData() {
    update(["main"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // 歷史紀錄
  void onHistory() {
    Get.offNamed(RouteNames.historyHome);
  }

  // 設定
  void onSetting() {
    Get.offNamed(RouteNames.myMyIndex);
  }

  // 運動
  void onSport() {
    Get.offNamed(RouteNames.sportsSportsIndex);
  }

  // 社群
  void onCommunity() {
    Get.offNamed(RouteNames.communityCommunityMain);
  }

  // 成就
  void onAchievement() {
    Get.offNamed(RouteNames.achievementAchievementIndex);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();

    Get.toNamed(RouteNames.systemRegister);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
