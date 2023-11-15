import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

/// 歡迎 slider
class WelcomeSliderWidget extends StatelessWidget {
  /// 項目
  final List<WelcomeModel> items;

  /// 頁數發生變化
  final Function(int) onPageChanged;

  /// 控制器
  final CarouselController? carouselController;

  const WelcomeSliderWidget(
    this.items, {
    Key? key,
    required this.onPageChanged,
    this.carouselController,
  }) : super(key: key);

  Widget _sliderItem(WelcomeModel item) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.image!),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 93, left: 24, right: 24),

            //
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 26.w,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 8.w,
                              width: 168.w,
                              child: _linearProgressIndcator(item),
                            ),
                            const Spacer(),
                            ButtonWidget.text(
                              textColor: Colors.white,
                              "Skip",
                              onTap: () {
                                Get.offNamed(RouteNames.systemSignup);
                              },
                            ),
                          ],
                        ),
                        // width: 168.w,
                        // height: 8.w,
                        // child: _linearProgressIndcator(),
                      ),
                      SizedBox(height: 56.w),
                      TextWidget.headingsm(
                        item.title ?? "",
                        color: AppColors.white,
                        maxLines: 2,
                        softWrap: true,
                      ),
                      SizedBox(height: 12.w),
                      TextWidget.paragraphmd(
                        item.desc ?? "",
                        softWrap: true,
                        color: AppColors.white,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 24.w),
                            child: Visibility(
                              visible:
                                  (items.indexOf(item) == items.length - 1),
                              child: Container(
                                width: 80.w,
                                height: 80.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ButtonWidget.icon(
                                  IconWidget.svg(
                                    AssetsMonotoneSvgs.arrowRightLgSvg47,
                                    size: 32,
                                  ),
                                  onTap: () {
                                    Get.offNamed(RouteNames.systemSignup);
                                  },
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 8,
                //   width: 168,
                //   child:
                //   _linearProgressIndcator(),
                // ),
              ],
            ),
          ),
        );
      },
    );

    // backgroundColor(AppColors.blue100)
  }

  _linearProgressIndcator(WelcomeModel item) {
    return LinearPercentIndicator(
      lineHeight: 8.w,
      percent: (items.indexOf(item) + 1) / items.length,
      backgroundColor: const Color(0XFF09111D),
      progressColor: AppColors.white,
      barRadius: Radius.circular(3.w),
      padding: EdgeInsets.zero,
    );
  }

  // Widget sliderItem(WelcomeModel item) {
  //   return Builder(
  //     builder: (BuildContext context) {
  //       return <Widget>[
  //         // 標題
  //         if (item.title != null)
  //           TextWidget.headingsm(
  //             item.title ?? "",
  //             maxLines: 2,
  //             softWrap: true,
  //             textAlign: TextAlign.center,
  //           ),

  //         // 描述
  //         if (item.desc != null)
  //           TextWidget.paragraphmd(
  //             item.desc ?? "",
  //             maxLines: 2,
  //             softWrap: true,
  //             textAlign: TextAlign.center,
  //           ),

  //         // 圖
  //         if (item.image != null)
  //           ImageWidget.asset(
  //             item.image!,
  //             fit: BoxFit.cover,
  //           ),

  //         // backgroundColor(AppColors.blue100)
  //       ]
  //           .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
  //           .width(MediaQuery.of(context).size.width);
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   for (var item in items) {
  //     return sliderItem2(item);
  //   }
  //   return sliderItem2(
  //     items[0],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        // height: 600.w,
        // width: double.maxFinite,
        height: double.maxFinite,
        viewportFraction: 1, // 充滿
        enlargeCenterPage: false, // 動畫 封面效果
        enableInfiniteScroll: false, // 無限循環
        autoPlay: false, // 自動播放
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: <Widget>[
        for (var item in items) _sliderItem(item),
      ].toList(),
    );
  }
}
