import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

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
          // 透明的appbar
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          // 內容頁
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 頭部
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget.iconTextUpDown(
                      IconWidget.image(
                        AssetsImages.socialPng,
                        size: 80,
                      ).paddingLeft(AppSpace.page),
                      LocaleKeys.pageBtnCommunity.tr,
                      onTap: () {
                        controller.onCommunity();
                      },
                    ),
                    ButtonWidget.icon(
                      IconWidget.image(
                        AssetsImages.levelPng,
                        size: 180,
                      ),
                      onTap: () {},
                    ),
                    ButtonWidget.iconTextUpDown(
                      IconWidget.image(
                        AssetsImages.achievementPng,
                        size: 80,
                      ),
                      LocaleKeys.pageBtnAchievement.tr,
                      onTap: () {
                        controller.onAchievement();
                      },
                    ).paddingRight(AppSpace.page),
                  ],
                ),
                // 選單
                Container(
                  height: 450,
                  // const Center(
                  //   child: Text("CategoryPage"),
                ),

                // Container(
                //   height: 600,
                //   color: Colors.blue,
                // ),
                //畫面下方三個按鈕
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget.iconTextUpDown(
                      IconWidget.image(
                        AssetsImages.workoutButtonPng,
                        size: 80,
                      ),
                      LocaleKeys.pageBtnWorkout.tr,
                      onTap: () {
                        controller.onSport();
                      },
                    ),
                    ButtonWidget.iconTextUpDown(
                      IconWidget.image(
                        AssetsImages.historyPng,
                        size: 80,
                      ).paddingHorizontal(25),
                      LocaleKeys.pageBtnhistory.tr,
                      onTap: () {
                        controller.onHistory();
                      },
                    ),
                    ButtonWidget.iconTextUpDown(
                      IconWidget.image(
                        AssetsImages.settingPng,
                        size: 80,
                      ),
                      LocaleKeys.pageBtnSetting.tr,
                      onTap: () {
                        controller.onSetting();
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
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
