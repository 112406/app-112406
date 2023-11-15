import 'package:flutter/material.dart';
import 'package:healthcare_app/common/index.dart';

// 頁面標題 組件
class PageTitleWidget extends StatelessWidget {
  /// 標題
  final String title;

  /// 說明
  final String desc;

  const PageTitleWidget({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.headingmd(title),
      const SizedBox(height: 12),
      TextWidget.paragraphmd(
        desc,
        color: AppColors.gray60,
        maxLines: 2,
        softWrap: true,
      ),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          top: 109,
          bottom: 32,
        );
  }
}
