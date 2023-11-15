import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class WellnessContentController extends GetxController {
  WellnessContentController();

  var url = Get.arguments;

  List<NewsContentModel> newsContent = [];
  int i = 0;
  NewsRepository newsRepository = NewsRepository();

  _initData() {
    update(["wellness_content"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    i = 0;
    newsRepository.fetchNewsContent(url).then((value) {
      newsContent.clear();
      newsContent.addAll(value);
      update(["wellness_content"]);
    });
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
