import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/utils/loading.dart';
import 'package:healthcare_app/pages/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

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
        bottomNavigationBar: SizedBox(
          height: 100,
          child: GetBuilder<MainController>(
            id: 'navigation',
            builder: (controller) {
              return BuildNavigation(
                currentIndex: controller.currentIndex,
                items: [
                  NavigationItemModel(
                    icon: AssetsMonotoneSvgs.homeGeneralSvg35,
                  ),
                  NavigationItemModel(
                    // label: LocaleKeys.tabBarCart.tr,
                    icon: AssetsMonotoneSvgs.mobilePhoneHealthSvg09,
                    // count: 3,
                  ),
                  NavigationItemModel(
                    // label: LocaleKeys.tabBarMessage.tr,
                    icon: AssetsMonotoneSvgs.chartSvg02,
                    // count: 9,
                  ),
                  NavigationItemModel(
                    // label: LocaleKeys.tabBarProfile.tr,
                    icon: AssetsMonotoneSvgs.userSv22g,
                  ),
                ],
                onTap: controller.onJumpToPage, // 切換tab事件
              );
            },
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            // 加入空頁面佔位
            HomeIndexPage(),
            WellnessIndexPage(),
            TrackerIndexPage(),
            MyAccountPage(),
          ],
        ),
      ),
      // child: Scaffold(
      //   extendBody: true,
      //   resizeToAvoidBottomInset: false,
      //   // 導航欄
      //   bottomNavigationBar: GetBuilder<MainController>(
      //     id: 'navigation',
      //     builder: (controller) {
      //       return BuildNavigation(
      //         currentIndex: controller.currentIndex,
      //         items: [
      //           NavigationItemModel(
      //             label: LocaleKeys.tabBarHome.tr,
      //             icon: AssetsSvgs.navHomeSvg,
      //           ),
      //           NavigationItemModel(
      //             label: LocaleKeys.tabBarCart.tr,
      //             icon: AssetsSvgs.navCartSvg,
      //             count: 3,
      //           ),
      //           NavigationItemModel(
      //             label: LocaleKeys.tabBarMessage.tr,
      //             icon: AssetsSvgs.navMessageSvg,
      //             count: 9,
      //           ),
      //           NavigationItemModel(
      //             label: LocaleKeys.tabBarProfile.tr,
      //             icon: AssetsSvgs.navProfileSvg,
      //           ),
      //         ],
      //         onTap: controller.onJumpToPage, // 切換tab事件
      //       );
      //     },
      //   ),
      //   // 內容頁
      //   body: PageView(
      //     physics: const NeverScrollableScrollPhysics(),
      //     controller: controller.pageController,
      //     onPageChanged: controller.onIndexChanged,
      //     children: const [
      //       // 加入空頁面佔位
      //       Text("1"),
      //       Text("2"),
      //       Text("3"),
      //       Text("4"),
      //     ],
      //   ),
      // ),
      // child: Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: const [
      //     Icons.wb_sunny,
      //     Icons.wb_cloudy,
      //     Icons.wb_twighlight,
      //     Icons.terrain,
      //   ],
      //   activeIndex: controller.currentIndex,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.defaultEdge,
      //   leftCornerRadius: 32,
      //   rightCornerRadius: 32,
      //   onTap: controller.onJumpToPage, // 切換tab事件,
      // ),
      // // 內容頁
      // body: PageView(
      //   physics: const NeverScrollableScrollPhysics(),
      //   controller: controller.pageController,
      //   onPageChanged: controller.onIndexChanged,
      //   children: const [
      //     // 加入空頁面佔位
      //     Text("1"),
      //     Text("2"),
      //     Text("3"),
      //     Text("4"),
      //   ],
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      //   onPressed: () {},
      //   elevation: 2.0,
      //   backgroundColor: AppColors.primary,
      //   // label: const Text('Add'),
      //   // label: const Icon(Icons.add),
      //   child: IconWidget.svg(
      //     AssetsMonotoneSvgs.addSvg03,
      //     color: AppColors.white,
      //     size: 24,
      //   ),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   notchMargin: 8.0,
      //   height: 80.0,
      //   // clipBehavior: Clip.antiAlias,
      //   shape: const AutomaticNotchedShape(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(
      //         top: Radius.circular(32.0),
      //       ),
      //     ),
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(16)),
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         // IconButton(
      //         //   icon: const Icon(Icons.menu),
      //         //   onPressed: () {},
      //         // ),
      //         ButtonWidget.icon(
      //           IconWidget.svg(
      //             AssetsMonotoneSvgs.mobilePhoneHealthSvg09,
      //             size: 24,
      //           ),
      //           onTap: () {},
      //         ),
      //         ButtonWidget.icon(
      //           IconWidget.svg(
      //             AssetsMonotoneSvgs.mobilePhoneHealthSvg09,
      //             size: 24,
      //           ),
      //           onTap: () {},
      //         ),
      //         ButtonWidget.icon(
      //           IconWidget.svg(
      //             AssetsMonotoneSvgs.mobilePhoneHealthSvg09,
      //             size: 24,
      //           ),
      //           onTap: () {},
      //         ),
      //         ButtonWidget.icon(
      //           IconWidget.svg(
      //             AssetsMonotoneSvgs.mobilePhoneHealthSvg09,
      //             size: 24,
      //           ),
      //           onTap: () {},
      //         ),
      //         // IconButton(
      //         //   icon: const Icon(Icons.search),
      //         //   onPressed: () {},
      //         // ),
      //         // const SizedBox(
      //         //   width: 40,
      //         // )
      //       ],
      //     ),
      //     ),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}

// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = AppColors.gray10
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, 0);
//     path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 10);
//     // path.arcToPoint(Offset(size.width * 0.6, 10),
//     //     radius: const Radius.circular(10.0), clockwise: false);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return false;
//   }
// }
