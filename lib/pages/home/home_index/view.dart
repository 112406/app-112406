import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HomeIndexPage extends GetView<HomeIndexController> {
  const HomeIndexPage({Key? key}) : super(key: key);

  // 導覽列
  AppBar _buildAppBar() {
    // var day = Day();
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消陰影
      elevation: 0,
      // 標題欄左側間距
      titleSpacing: AppSpace.page,

      toolbarHeight: 82,
      title: Column(
        children: [
          Row(
            children: [
              // 圖標
              IconWidget.svg(
                AssetsMonotoneSvgs.calendarSvg17,
                size: 20,
                color: AppColors.blue40,
              ),
              const SizedBox(width: 8),
              // 文字
              TextWidget.textsm(
                Day().format("WWW,DD MMM YYYY"),
                color: AppColors.gray50,
                weight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextWidget.headingsm(
            "${LocaleKeys.ghomeHelloUser.tr}${UserService.to.profile.name}",
            // LocaleKeys.ghomeHelloUser.tr,
            color: AppColors.gray100,
            weight: FontWeight.w900,
          ).alignLeft()
        ],
      ),
      // TextWidget.textsm(
      //   Day().format("WWW,DD MMM YYYY"),
      //   color: AppColors.gray50,
      //   weight: FontWeight.w600,
      // ),
      // title: InputWidget.search(
      //   // 提示文字，多語言
      //   hintText: LocaleKeys.ghomeHelloUser.tr,
      //   // 點擊事件
      //   onTap: controller.onAppBarTap,
      //   // 只讀
      //   readOnly: true,
      // ),
      // 右側的按鈕區
      actions: [
        // 圖標
        Container(
          width: 64.w,
          height: 64.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ButtonWidget.icon(IconWidget.svg(
            AssetsMonotoneSvgs.bellNotificationSvg41,
            size: 32,
            isDot: true, // 未讀訊息 小圓點
          )),
        ).unconstrained().padding(
              // left: 0,
              right: AppSpace.page,
            ),
        // IconWidget.svg(
        //   AssetsMonotoneSvgs.bellNotificationSvg41,
        //   size: 20,
        //   isDot: true, // 未讀訊息 小圓點
        // )
        //     .unconstrained() // 去掉約束, appBar 會有個約束下來
        //     .padding(
        //       left: AppSpace.listItem,
        //       right: AppSpace.page,
        //     ),
      ],
    );
  }

  // 身體分數
  Widget _buildBanner() {
    return Container(
            padding: const EdgeInsets.all(12),
            height: 104,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  // padding: const EdgeInsets.only(
                  //   left: 16,
                  //   right: 16,
                  // ),
                  height: 80.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.purple60,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // padding: const EdgeInsets.only(
                  //   left: 16,
                  //   right: 16,
                  // ),
                  child: Center(
                    child: TextWidget.headingmd(
                      "88",
                      weight: FontWeight.w900,
                      color: AppColors.white,
                    ).paddingAll(8),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.textmd(
                      LocaleKeys.ghomeWellnessScoreTitle.tr,
                      weight: FontWeight.w900,
                    ),
                    const SizedBox(height: 8),
                    TextWidget.paragraphxs(
                      LocaleKeys.ghomeWellnessScoreDesc.tr,
                      color: AppColors.gray70,
                      weight: FontWeight.w500,
                      maxLines: 2,
                      softWrap: true,
                    )
                  ],
                ))
              ],
            )

            // Container(
            // padding: const EdgeInsets.only(
            //   top: 12,
            //   bottom: 12,
            // // ),
            // height: 64.w,
            // width: 64.w,
            // decoration: BoxDecoration(
            //   color: AppColors.purple60,
            //   borderRadius: BorderRadius.circular(12),
            // ),
            // ),
            )
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page)
        .sliverPaddingTop(32);
  }

  // 分類導航
  Widget _buildCategories() {
    return Container()
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page)
        .sliverPaddingBottom(32);
  }

  // Flash Sell
  Widget _buildFlashSell() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        // card heart rate
        Material(
          color: AppColors.blue60,
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            // decoration: BoxDecoration(
            //   color: AppColors.blue60,
            //   borderRadius: BorderRadius.circular(16),
            // ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              // splashColor: Colors.black,
              onTap: () {
                print('Card tapped.');
                Get.toNamed(RouteNames.homeHeartRate);
              },
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  // color: AppColors.blue60,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    TextWidget.textxs(
                      LocaleKeys.ghomeFuncCardHeartRate.tr,
                      weight: FontWeight.w700,
                      color: AppColors.white,
                    ).alignLeft().paddingOnly(top: 12, left: 12),
                    const SizedBox(height: 8),
                    const ImageWidget.asset(
                      AssetsImages.heartratecardPng,
                    ).alignLeft().paddingHorizontal(12),
                    const SizedBox(height: 8),
                    ValueListenableBuilder(
                      valueListenable: controller.heartRates,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            TextWidget.text2xl(
                              value.isNotEmpty
                                  ? value.last.value.toInt().toString()
                                  : "-",
                              // value.last.value.toString() ?? "-",
                              // LocaleKeys.ghomeFuncCardHeartRateNumber.tr, //65
                              weight: FontWeight.w900,
                              color: AppColors.white,
                            ).alignLeft().paddingOnly(bottom: 12, left: 12),
                            TextWidget.textxs(
                              LocaleKeys.ghomeFuncCardHeartRateBPM.tr,
                              weight: FontWeight.w600,
                              color: AppColors.white,
                            )
                                .alignBottom()
                                .paddingOnly(bottom: 12, top: 10, left: 2),
                          ],
                        );
                      },
                    ),
                    // Row(
                    //   children: [
                    //     TextWidget.text2xl(
                    //       LocaleKeys.ghomeFuncCardHeartRateNumber.tr, //65
                    //       weight: FontWeight.w900,
                    //       color: AppColors.white,
                    //     ).alignLeft().paddingOnly(bottom: 12, left: 12),
                    //     TextWidget.textxs(
                    //       LocaleKeys.ghomeFuncCardHeartRateBPM.tr,
                    //       weight: FontWeight.w600,
                    //       color: AppColors.white,
                    //     )
                    //         .alignBottom()
                    //         .paddingOnly(bottom: 12, top: 10, left: 2),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(
          width: 8,
        ),
        Material(
          color: AppColors.red50,
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            // decoration: BoxDecoration(
            //   color: AppColors.blue60,
            //   borderRadius: BorderRadius.circular(16),
            // ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              // splashColor: Colors.black,
              onTap: () {
                print('Card tapped.');
                Get.toNamed(RouteNames.homeBloodPressure);
              },
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  // color: AppColors.red50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    TextWidget.textxs(
                      LocaleKeys.ghomeFuncCardBloodPressure.tr,
                      weight: FontWeight.w700,
                      color: AppColors.white,
                    ).alignLeft().paddingOnly(top: 12, left: 12),
                    const SizedBox(height: 8),
                    const ImageWidget.asset(
                      AssetsImages.bloodpressurecardPng,
                    ).alignLeft().paddingHorizontal(12),
                    const SizedBox(height: 8),
                    ValueListenableBuilder(
                        valueListenable: controller.bloodPressures,
                        builder: (context, value, child) {
                          return Row(
                            children: [
                              TextWidget.text2xl(
                                // value.last.value.toString(),
                                value.isNotEmpty
                                    ? value.last.value.toInt().toString()
                                    : "-",
                                // LocaleKeys.ghomeFuncCardBloodPressureNumber.tr,
                                weight: FontWeight.w900,
                                color: AppColors.white,
                              ).alignLeft().paddingOnly(bottom: 12, left: 12),
                              TextWidget.textxs(
                                LocaleKeys.ghomeFuncCardBloodPressureMMHG.tr,
                                weight: FontWeight.w600,
                                color: AppColors.white,
                              )
                                  .alignBottom()
                                  .paddingOnly(bottom: 12, top: 10, left: 2),
                            ],
                          );
                        }),
                    // Row(
                    //   children: [
                    //     TextWidget.text2xl(
                    //       LocaleKeys.ghomeFuncCardBloodPressureNumber.tr,
                    //       weight: FontWeight.w900,
                    //       color: AppColors.white,
                    //     ).alignLeft().paddingOnly(bottom: 12, left: 12),
                    //     TextWidget.textxs(
                    //       LocaleKeys.ghomeFuncCardBloodPressureMMHG.tr,
                    //       weight: FontWeight.w600,
                    //       color: AppColors.white,
                    //     )
                    //         .alignBottom()
                    //         .paddingOnly(bottom: 12, top: 10, left: 2),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Material(
          color: AppColors.teal30,
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            // decoration: BoxDecoration(
            //   color: AppColors.blue60,
            //   borderRadius: BorderRadius.circular(16),
            // ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              // splashColor: Colors.black,
              onTap: () {
                print('Card tapped.');
                Get.toNamed(RouteNames.homeSleepTracker);
              },
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  // color: AppColors.teal30,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    TextWidget.textxs(
                      LocaleKeys.ghomeFuncCardStep.tr,
                      weight: FontWeight.w700,
                      color: AppColors.white,
                    ).alignLeft().paddingOnly(top: 12, left: 12),
                    const SizedBox(height: 8),
                    const ImageWidget.asset(
                      AssetsImages.sleepcardPng,
                    ).alignLeft().paddingHorizontal(12),
                    const SizedBox(height: 8),
                    ValueListenableBuilder(
                      valueListenable: controller.steps,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            TextWidget.text2xl(
                              // value.last.value.toString(),
                              value.isNotEmpty
                                  ? value.last.value.toInt().toString()
                                  : "-",
                              // LocaleKeys.ghomeFuncCardSleepNumber.tr,
                              weight: FontWeight.w900,
                              color: AppColors.white,
                            ).alignLeft().paddingOnly(bottom: 12, left: 12),
                            TextWidget.textxs(
                              LocaleKeys.ghomeFuncCardStepSteps.tr,
                              weight: FontWeight.w600,
                              color: AppColors.white,
                            )
                                .alignBottom()
                                .paddingOnly(bottom: 12, top: 10, left: 2),
                          ],
                        );
                      },
                    ),
                    // Row(
                    //   children: [
                    //     TextWidget.text2xl(
                    //       LocaleKeys.ghomeFuncCardSleepNumber.tr,
                    //       weight: FontWeight.w900,
                    //       color: AppColors.white,
                    //     ).alignLeft().paddingOnly(bottom: 12, left: 12),
                    //     TextWidget.textxs(
                    //       LocaleKeys.ghomeFuncCardSleepHours.tr,
                    //       weight: FontWeight.w600,
                    //       color: AppColors.white,
                    //     )
                    //         .alignBottom()
                    //         .paddingOnly(bottom: 12, top: 10, left: 2),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    )
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page)
        .sliverPaddingBottom(32);
  }

  // New Sell
  Widget _buildNewSell() {
    return Column(
      children: [
        // caroies burn
        Container(
          padding: const EdgeInsets.all(12),
          height: 104,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                  color: AppColors.gray10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconWidget.svg(
                    AssetsMonotoneSvgs.sportsBarbellSvg77,
                    size: 24,
                    color: AppColors.gray50,
                  ),
                ),
              ).unconstrained(),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.textmd(
                    LocaleKeys.ghomeFitnessCaloriesTitle.tr,
                    weight: FontWeight.w900,
                  ),
                  const SizedBox(height: 8),
                  TextWidget.paragraphxs(
                    LocaleKeys.ghomeWellnessScoreDesc.tr,
                    color: AppColors.gray70,
                    weight: FontWeight.w500,
                    maxLines: 2,
                    softWrap: true,
                  )
                ],
              ))
            ],
          ),
        ),
        const SizedBox(height: 8),

        // steps taken
        Container(
          padding: const EdgeInsets.all(12),
          height: 104,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                  color: AppColors.gray10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconWidget.svg(
                    AssetsMonotoneSvgs.activityWalkingSvg79,
                    size: 24,
                    color: AppColors.gray50,
                  ),
                ),
              ).unconstrained(),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.textmd(
                    LocaleKeys.ghomeFitnessStepsTaken.tr,
                    weight: FontWeight.w900,
                  ),
                  const SizedBox(height: 8),
                  ValueListenableBuilder(
                    valueListenable: controller.steps,
                    builder: (context, value, child) {
                      return TextWidget.paragraphxs(
                        LocaleKeys.ghomeFitnessStepsTakenDesc.trParams({
                          "steps": value.isNotEmpty
                              ? value.last.value.toInt().toString()
                              : "-",
                        }),
                        color: AppColors.gray70,
                        weight: FontWeight.w500,
                        maxLines: 2,
                        softWrap: true,
                      );
                    },
                  ),
                  // TextWidget.paragraphxs(
                  //   LocaleKeys.ghomeFitnessStepsTakenDesc.trParams({
                  //     "steps": ,
                  //   }),
                  //   color: AppColors.gray70,
                  //   weight: FontWeight.w500,
                  //   maxLines: 2,
                  //   softWrap: true,
                  // )
                ],
              ))
            ],
          ),
        ),
        const SizedBox(height: 8),

        // nutrition
        Container(
          padding: const EdgeInsets.all(12),
          height: 104,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                  color: AppColors.gray10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconWidget.svg(
                    AssetsMonotoneSvgs.appleSvg48,
                    size: 24,
                    color: AppColors.gray50,
                  ),
                ),
              ).unconstrained(),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.textmd(
                    LocaleKeys.ghomeFitnessNutrition.tr,
                    weight: FontWeight.w900,
                  ),
                  const SizedBox(height: 8),
                  TextWidget.paragraphxs(
                    LocaleKeys.ghomeWellnessScoreDesc.tr,
                    color: AppColors.gray70,
                    weight: FontWeight.w500,
                    maxLines: 2,
                    softWrap: true,
                  )
                ],
              ))
            ],
          ),
        ),
        const SizedBox(height: 8),

        // sleep
        Container(
          padding: const EdgeInsets.all(12),
          height: 104,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                  color: AppColors.gray10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconWidget.svg(
                    AssetsMonotoneSvgs.bedSvg46,
                    size: 24,
                    color: AppColors.gray50,
                  ),
                ),
              ).unconstrained(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.textmd(
                      LocaleKeys.ghomeFitnessSleep.tr,
                      weight: FontWeight.w900,
                    ),
                    const SizedBox(height: 8),
                    TextWidget.paragraphxs(
                      LocaleKeys.ghomeFitnessSleepDesc.trParams({
                        "hours": "8",
                      }),
                      color: AppColors.gray70,
                      weight: FontWeight.w500,
                      maxLines: 2,
                      softWrap: true,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8)
      ],
    )
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page)
        .sliverPaddingBottom(100);
  }

  // 主視圖
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 輪播廣告
        _buildBanner(),

        // 分類導航
        _buildCategories(),

        // Flash Sell
        // title
        TextWidget.textmd(
          LocaleKeys.ghomeFitnessTrackerTitle.tr,
          weight: FontWeight.w900,
        )
            .sliverToBoxAdapter()
            .sliverPaddingHorizontal(AppSpace.page)
            .sliverPaddingBottom(12),

        // list
        _buildFlashSell(),

        // new product
        // title
        TextWidget.textmd(
          LocaleKeys.ghomeHealthTitle.tr,
          weight: FontWeight.w900,
        )
            .sliverToBoxAdapter()
            .sliverPaddingHorizontal(AppSpace.page)
            .sliverPaddingBottom(12),

        // list
        _buildNewSell(),
      ],

      // 輪播廣告
      // _buildBanner(),

      // 分類導航
      // _buildCategories(),

      // Flash Sell
      // title
      // Text(LocaleKeys.ghomeFitnessTrackerTitle.tr)
      //     .sliverToBoxAdapter()
      //     .sliverPaddingHorizontal(AppSpace.page),

      // list
      // _buildFlashSell(),

      // new product
      // title
      // Text(LocaleKeys.ghomeHealthTitle.tr)
      //     .sliverToBoxAdapter()
      //     .sliverPaddingHorizontal(AppSpace.page),

      // list
      // _buildNewSell(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeIndexController>(
      init: HomeIndexController(),
      id: "home_index",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SmartRefresher(
              controller: controller.refreshController, // 刷新控制器
              onRefresh: controller.onRefresh, // 下拉刷新回調
              child: _buildView()),
        );
      },
    );
  }
}
