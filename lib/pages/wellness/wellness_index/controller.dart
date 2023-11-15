import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/models/news_content_model.dart';
import 'package:healthcare_app/common/services/news_repository.dart';

class WellnessIndexController extends GetxController {
  WellnessIndexController();

  List<NewsCoverModel> newsCover = [];
  NewsRepository newsRepository = NewsRepository();


  _initData() {
    update(["wellness_index"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    newsRepository.fetchNewsCover().then((value) {
      newsCover.clear();
      newsCover.addAll(value);
      update(["wellness_index"]);
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
