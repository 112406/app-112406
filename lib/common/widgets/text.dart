import 'package:flutter/material.dart';
import 'package:healthcare_app/common/index.dart';

/// 文字組件
class TextWidget extends StatelessWidget {
  /// 文字字符串
  final String text;

  /// 樣式
  final TextStyle? style;

  /// 顏色
  final Color? color;

  /// 大小
  final double? size;

  /// 重量
  final FontWeight? weight;

  /// 行數
  final int? maxLines;

  /// 自動換行
  final bool? softWrap;

  /// 溢出
  final TextOverflow? overflow;

  /// 對齊方式
  final TextAlign? textAlign;

  const TextWidget({
    Key? key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : super(key: key);

  /// 文字 - 按钮
  TextWidget.button({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    Color? color,
    this.size,
    this.weight,
    this.textAlign,
  })  : color = color ?? AppColors.secondary,
        style = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        super(key: key);

  /// 文字 - 导航
  const TextWidget.navigation({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        super(key: key);

  /// Display-lg
  const TextWidget.displaylg(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 180,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Display-md
  const TextWidget.displaymd(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 128,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Display-sm
  const TextWidget.displaysm(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Heading 2xl
  const TextWidget.heading2xl(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Heading xl
  const TextWidget.headingxl(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Heading lg
  const TextWidget.headinglg(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Heading md
  const TextWidget.headingmd(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
        ),
        super(key: key);

  /// Heading sm
  const TextWidget.headingsm(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Heading xs
  const TextWidget.headingxs(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Text 2xl
  const TextWidget.text2xl(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Text xl
  const TextWidget.textxl(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Text lg
  const TextWidget.textlg(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Text md
  const TextWidget.textmd(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Text sm
  const TextWidget.textsm(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 14,
          // fontWeight: FontWeight.w800,
        ),
        super(key: key);

  /// Text xs
  const TextWidget.textxs(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Text 2xs
  const TextWidget.text2xs(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Paragraph 2xl
  const TextWidget.paragraph2xl(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Paragraph xl
  const TextWidget.paragraphxl(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Paragraph lg
  const TextWidget.paragraphlg(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Paragraph md
  const TextWidget.paragraphmd(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// Paragraph sm
  const TextWidget.paragraphsm(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Paragraph xs
  const TextWidget.paragraphxs(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// Label 2XL
  const TextWidget.label2XL(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Label XL
  const TextWidget.labelXL(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// Label LG
  const TextWidget.labelLG(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// LabelMD
  const TextWidget.labelMD(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// LabelSM
  const TextWidget.labelSM(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// LabelSM
  const TextWidget.labelXS(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == "") {
      return const SizedBox();
    }
    return Text(
      text,
      style: style?.copyWith(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ) ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
    );
  }
}
