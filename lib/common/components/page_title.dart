import 'package:flutter/material.dart';
import 'package:project_fitness/common/index.dart';

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
      TextWidget.title1(title),
      TextWidget.body2(desc),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          left: 10,
          top: 10,
          bottom: 30,
        );
  }
}
