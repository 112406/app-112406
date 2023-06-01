import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';
import 'package:project_fitness/pages/index.dart';

class CommunityMainPage extends StatefulWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

  @override
  State<CommunityMainPage> createState() => _CommunityMainPageState();
}

class _CommunityMainPageState extends State<CommunityMainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _CommunityMainViewGetX();
  }
}

class _CommunityMainViewGetX extends GetView<CommunityMainController> {
  const _CommunityMainViewGetX({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    DateTime? lastPressedAt;
    return WillPopScope(
      // 防止連續點擊兩次退出
      onWillPop: () async {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();
          Loading.toast('Press again to exit');
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // 導航欄
        bottomNavigationBar: GetBuilder<CommunityMainController>(
          id: 'navigation',
          builder: (controller) {
            return BuildNavigation(
              currentIndex: controller.currentIndex,
              items: [
                NavigationItemModel(
                  label: LocaleKeys.tabBarHome.tr,
                  icon: AssetsSvgs.navHomeSvg,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarMessage.tr,
                  icon: AssetsSvgs.navMessageSvg,
                  count: 3,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarRanking.tr,
                  icon: AssetsSvgs.navRankingSvg,
                  count: 9,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarProfile.tr,
                  icon: AssetsSvgs.navProfileSvg,
                ),
              ],
              onTap: controller.onJumpToPage, // 切換tab事件
            );
          },
        ),
        // 內容頁
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // 不响应用户的滚动
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            HomePage(),
            RankingIndexPage(),
            MsgIndexPage(),
            MyIndexPage(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityMainController>(
      // init: CommunityMainController(),
      id: "community_main",
      builder: (_) => _buildView(),
    );
  }
}
