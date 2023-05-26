import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel>? items;

  // 當前位置
  int currentIndex = 0;
  bool isShowStart = false; // 是否顯示 Start
  CarouselController carouselController = CarouselController(); // slider 控制器

  // 當前位置發生改變
  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(['slider', 'bar']);
  }

  // 去首頁
  void onToMain() {
    Get.offAllNamed(RouteNames.systemMain);
  }

  // 下一個
  void onNext() {
    carouselController.nextPage();
  }

  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];
    update(["slider"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // 設置已打開
    ConfigService().setAlreadyOpen();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
