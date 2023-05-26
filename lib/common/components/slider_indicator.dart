import 'package:flutter/material.dart';
import 'package:project_fitness/common/index.dart';

/// slider indicator 指示器
class SliderIndicatorWidget extends StatelessWidget {
  /// 個數
  final int length;

  /// 當前位置
  final int currentIndex;

  /// 顏色
  final Color color;

  /// 是否原型
  final bool isCircle;

  /// 對齊方式
  final MainAxisAlignment alignment;

  SliderIndicatorWidget({
    Key? key,
    required this.length,
    required this.currentIndex,
    Color? color,
    this.isCircle = false,
    this.alignment = MainAxisAlignment.center,
  })  : color = color ?? AppColors.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,

      // 採用 list.generate 方式生成 item 項
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          // 圓型寬度 6 , 否則當前位置 15 , 其他位置 8
          width: !isCircle
              ? currentIndex == index
                  ? 15.0
                  : 8
              : 6,
          // 圓型高度 6 , 否則 4
          height: !isCircle ? 4 : 6,
          decoration: BoxDecoration(
            // 圓角 4
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            // 非當前位置透明度 0.3
            color: currentIndex == index ? color : color.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
