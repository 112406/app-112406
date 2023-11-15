import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';
import 'widgets/index.dart';

class MyAccountPage extends GetView<MyAccountController> {
  const MyAccountPage({Key? key}) : super(key: key);

  // 按鈕列表
  Widget _buildButtonsList() {
    return <Widget>[
      // User Info
      // ButtonItemWidget(title: title, svgPath: svgPath),

      // settingGeneralTitle
      TextWidget.textmd(
        LocaleKeys.settingGeneralTitle.tr,
        color: Colors.black,
      ).paddingBottom(16).alignLeft(),

      // Edit Profile
      ButtonItemWidget(
        title: LocaleKeys.settingGeneralPersonalInfo.tr,
        svgPath: AssetsMonotoneSvgs.userSv22g,
        // color: "4971FF".toColor,
        onTap: () => Get.toNamed(RouteNames.settingsPersonalInfomation),
      ).paddingBottom(8),

      // Notification
      ButtonItemWidget(
        title: LocaleKeys.settingGeneralNotification.tr,
        svgPath: AssetsMonotoneSvgs.bellNotificationSvg40,
        // color: "F43284".toColor,
        // onTap: () => Get.toNamed(RouteNames.myNotification),
      ).paddingBottom(32),

      // settingAccessibilityTitle
      TextWidget.textmd(
        LocaleKeys.settingAccessibilityTitle.tr,
        color: Colors.black,
      ).paddingBottom(16).alignLeft(),

      // Language
      ButtonItemWidget(
        title: LocaleKeys.settingAccessibilityLanguage.tr,
        svgPath: AssetsMonotoneSvgs.flagSvg39,
        // color: "41AA3D".toColor,
        // onTap: () => Get.toNamed(RouteNames.myLanguage),
      ).paddingBottom(8),

      // Theme
      ButtonItemWidget(
        title: LocaleKeys.settingAccessibilityDarkMode.tr,
        svgPath: AssetsMonotoneSvgs.eyeSvg37,
        // color: "F89C52".toColor,
        // onTap: () => ConfigService.to.switchThemeModel(),
        onTap: () {
          ConfigService.to.switchThemeModel();
          controller.notifyHelper.displayNotification(
            title: "Theme",
            body: "Theme Changed",
          );
        },
      ).paddingBottom(32),

      // sign out
      TextWidget.textmd(
        LocaleKeys.settingSignOutTitle.tr,
        color: Colors.black,
      ).paddingBottom(16).alignLeft(),

      ButtonItemWidget(
        title: LocaleKeys.settingSignOutTitle.tr,
        svgPath: AssetsSolidSvgs.arrowCurvedBottomRightSvg29,
        // color: "41AA3D".toColor,
        onTap: () => controller.onLogout(),
      ).paddingBottom(8),

      // // Billing Address
      // ButtonItemWidget(
      //   title: LocaleKeys.myBtnBillingAddress.tr,
      //   svgPath: AssetsSvgs.pHomeSvg,
      //   color: "F43284".toColor,
      // ),

      // end
    ]
        .toColumn()
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page)
        .sliverPaddingBottom(32);
  }

  // 主視圖
  Widget _buildView() {
    return CustomScrollView(slivers: [
      // 按鈕清單
      _buildButtonsList(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAccountController>(
      init: MyAccountController(),
      id: "my_account",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: TextWidget.textxl(
              LocaleKeys.settingMyAccountTitle.tr,
              color: Colors.black,
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
