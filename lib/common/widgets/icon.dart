import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';

import '../index.dart';

enum IconWidgetType { icon, svg, image, url }

/// 圖標組件
class IconWidget extends StatelessWidget {
  /// 圖標類型
  final IconWidgetType type;

  /// 圖標數據
  final IconData? iconData;

  /// assets 路徑
  final String? assetName;

  /// 圖片 url
  final String? imageUrl;

  /// 尺寸
  final double? size;

  /// 寬
  final double? width;

  /// 高
  final double? height;

  /// 顏色
  final Color? color;

  /// 是否小圓點
  final bool? isDot;

  /// Badge 文字
  final String? badgeString;

  /// 圖片 fit
  final BoxFit? fit;

  const IconWidget({
    Key? key,
    this.type = IconWidgetType.icon,
    this.size,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  }) : super(key: key);

  IconWidget.icon(
    this.iconData, {
    Key? key,
    this.type = IconWidgetType.icon,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.image(
    this.assetName, {
    Key? key,
    this.type = IconWidgetType.image,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.svg(
    this.assetName, {
    Key? key,
    this.type = IconWidgetType.svg,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.url(
    this.imageUrl, {
    Key? key,
    this.type = IconWidgetType.url,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.fit,
  }) : super(key: key) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    switch (type) {
      case IconWidgetType.icon:
        icon = Icon(
          iconData,
          size: size,
          color: color ?? AppColors.primary,
        );
        break;
      case IconWidgetType.svg:
        icon = SvgPicture.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.image:
        icon = Image.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.url:
        icon = Image.network(
          imageUrl!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      default:
        return const SizedBox();
    }

    // 圓點
    if (isDot == true) {
      return Badge(
        position: BadgePosition.topEnd(top: 3, end: 4),
        child: icon,
      );
    }

    //文字、數字
    if (badgeString != null) {
      return Badge(
        badgeContent: Text(
          badgeString!,
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 9,
          ),
        ),
        position: BadgePosition.topEnd(top: -7, end: -8),
        child: icon,
      );
    }

    // 圖標
    return icon;
  }
}
