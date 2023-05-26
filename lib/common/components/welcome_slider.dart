import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_fitness/common/index.dart';

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

  Widget sliderItem(WelcomeModel item) {
    return Builder(
      builder: (BuildContext context) {
        return <Widget>[
          // 圖
          if (item.image != null)
            ImageWidget.asset(
              item.image!,
              fit: BoxFit.cover,
            ),

          // 標題
          if (item.title != null)
            TextWidget.title1(
              item.title ?? "",
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
            ),

          // 描述
          if (item.desc != null)
            TextWidget.body1(
              item.desc ?? "",
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.center,
            )
        ]
            .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
            .width(MediaQuery.of(context).size.width);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 500.w,
        viewportFraction: 1, // 充滿
        enlargeCenterPage: false, // 動畫 封面效果
        enableInfiniteScroll: false, // 無限循環
        autoPlay: false, // 自動播放
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: <Widget>[
        for (var item in items) sliderItem(item),
      ].toList(),
    );
  }
}
