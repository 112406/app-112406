import 'package:flutter/material.dart';
import '../index.dart';

enum FABButtonSize {
  none, // 0
  xsmall, // 32
  small, // 48
  medium, // 64
  large, // 80
  xLarge, // 96
}

/// FAB 按鈕
class FABButton extends StatelessWidget {
  /// 按鈕類型大小
  final FABButtonSize type;

  /// tap 事件
  final Function()? onTap;

  /// 子組件
  final Widget? child;

  /// 圖標
  final Widget? icon;

  /// 圓角
  final double? borderRadius;

  /// 背景色
  final Color? backgroundColor;

  /// 邊框色
  final Color? borderColor;

  /// 寬度
  final double? width;

  /// 高度
  final double? height;

  const FABButton({
    Key? key,
    this.type = FABButtonSize.none,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// FAB 按鈕 - 最小
  const FABButton.xsmall(
    this.icon, {
    Key? key,
    this.type = FABButtonSize.xsmall,
    Color? bgColor,
    this.onTap,
    this.child,
    this.borderRadius,
    this.borderColor,
    this.width = 32,
    this.height = 32,
  })  : backgroundColor = bgColor,
        super(key: key);

  /// FAB 按鈕 - 小
  const FABButton.small({
    Key? key,
    this.type = FABButtonSize.small,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// FAB 按鈕 - 中
  const FABButton.medium({
    Key? key,
    this.type = FABButtonSize.medium,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// FAB 按鈕 - 大
  const FABButton.large({
    Key? key,
    this.type = FABButtonSize.large,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// FAB 按鈕 - 最大
  const FABButton.xLarge({
    Key? key,
    this.type = FABButtonSize.xLarge,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
