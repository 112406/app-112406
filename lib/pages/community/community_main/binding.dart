//
import 'package:get/get.dart';
import 'package:project_fitness/pages/index.dart';

class CommunityMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<RankingIndexController>(() => RankingIndexController());
    Get.lazyPut<MsgIndexController>(() => MsgIndexController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<CommunityMainController>(() => CommunityMainController());
  }
}
