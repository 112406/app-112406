import 'package:flutter/material.dart';

import '../index.dart';

/// 列表行 ListTile 替代版本
class ListTileWidget extends StatelessWidget {
  /// 標題
  final Widget? title;

  /// 子標題
  final Widget? subtitle;

  /// 描述
  final Widget? description;

  /// 左側圖示
  final Widget? leading;

  /// 左側圖示間距
  final double? leadingSpace;

  /// 右側圖示
  final List<Widget>? trailing;

  /// 圓角
  final double? borderRadius;

  /// padding 邊框間距
  final EdgeInsetsGeometry? padding;

  /// cross 對齊方式
  final CrossAxisAlignment? crossAxisAlignment;

  /// 點擊事件
  final GestureTapCallback? onTap;

  /// 長按事件
  final GestureLongPressCallback? onLongPress;

  const ListTileWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.description,
    this.leading,
    this.leadingSpace,
    this.trailing,
    this.borderRadius,
    this.padding,
    this.crossAxisAlignment,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  _buildView() {
    List<Widget> ws = [];

    // 頭部圖示
    if (leading != null) {
      ws.add(
        leading!.paddingRight(
          leadingSpace ?? AppSpace.iconTextSmail,
        ),
      );
    }

    // 標題/子標題/描述
    List<Widget> titles = [
      if (title != null) title!,
      if (subtitle != null) subtitle!,
      if (description != null) description!,
    ];
    MainAxisAlignment titleMainAxisAlignment = titles.length == 1
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween;
    ws.add(
      titles
          .toColumn(
            mainAxisAlignment: titleMainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    );

    // 右側圖示
    if (trailing != null) {
      MainAxisAlignment trailingMainAxisAlignment = trailing?.length == 1
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween;
      ws.add(
        trailing!.toColumn(
          mainAxisAlignment: trailingMainAxisAlignment,
        ),
      );
    }

    return ws
        .toRow(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        )
        .backgroundColor(AppColors.white)
        .padding(value: padding)
        .onTap(onTap)
        .onLongPress(onLongPress);
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
