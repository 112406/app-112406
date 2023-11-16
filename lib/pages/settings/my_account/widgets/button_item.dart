import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_app/common/index.dart';

/// 按鈕列表項
class ButtonItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final Color? color;
  final Function()? onTap;

  const ButtonItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? AppColors.primary;
    // var color = this.color ?? AppColors.red30;

    return ListTile(
      shape: RoundedRectangleBorder(
        // side: const BorderSide(width: 2,),
        borderRadius: BorderRadius.circular(12.w),
      ),
      dense: true,
      tileColor: AppColors.primaryContainer,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.w,
      ),
      // 頭部圖示
      leading: <Widget>[
        // 底部圓形
        Container().tightSize(48.w).decorated(
              // // 按主色 0.2 的透明度
              // color: color.withOpacity(0.2),
              // 圓形邊框
              borderRadius: BorderRadius.circular(12.w),
              // outline
              border: Border.all(
                color: AppColors.outline,
                width: 1.w,
              ),
            ),

        // 疊加圖示
        IconWidget.svg(
          svgPath,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 24.w,
        ),
      ].toStack(
        alignment: Alignment.center,
      ),

      // 間距
      // leadingSpace: 20.w,

      // 標題
      title: TextWidget.textmd(
        title,
        size: 15.sp,
        weight: FontWeight.w600,
      ),

      // 右側箭頭
      trailing: IconWidget.svg(
        AssetsSolidSvgs.chevronRightLgSvg36,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 24.w,
      ),
      // size: 14.w,
      // color: AppColors.outline,

      // borderRadius: 12,
    ).inkWell(
      onTap: onTap,
    );
  }
}
