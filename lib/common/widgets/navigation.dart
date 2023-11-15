import 'package:flutter/material.dart';
import 'package:healthcare_app/common/index.dart';

/// 導航欄數據模型
class NavigationItemModel {
  // final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    // required this.label,
    required this.icon,
    this.count = 0,
  });
}

/// 導航欄
class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex) ? AppColors.primary : AppColors.gray30;
      var item = items[i];
      ws.add(
        <Widget>[
          // 圖標
          IconWidget.svg(
            item.icon,
            size: 24,
            color: color,
            badgeString: item.count > 0 ? item.count.toString() : null,
          ).paddingBottom(2),
          // // 文字
          // TextWidget.body1(
          //   item.label.tr,
          //   color: color,
          // ),
        ]
            .toColumn(
              mainAxisSize: MainAxisSize.min,
            )
            .onTap(() => onTap(i))
            .expanded(),
      );
    }
    return BottomAppBar(
      // clipBehavior: Clip.antiAlias,
      // shape: const CircularNotchedRectangle(),
      color: AppColors.surface,
      child: ws
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .height(80),
    );
  }
}
