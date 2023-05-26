import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../index.dart';

enum InputWidgetType {
  none,
  text, // 文字
  textBorder, // 邊框
  textFilled, // 填充/邊框
  iconTextFilled, // 圖標/文本/填充/邊框
  suffixTextFilled, // 後綴圖標/文本/填充/邊框
  search, // 搜尋
}

/// 輸入框
class InputWidget extends StatelessWidget {
  /// 輸入框類型
  final InputWidgetType type;

  /// 事件 - 提交
  final Function(String)? onSubmitted;

  /// 事件 - tap
  final Function()? onTap;

  /// 事件 - change
  final Function(String)? onChanged;

  /// 輸入控制器
  final TextEditingController? controller;

  /// 焦點
  final FocusNode? focusNode;

  /// 輸入框提示文字
  final String? hintText;

  /// 鍵盤類型
  final TextInputType? keyboardType;

  /// 圓角
  final double? borderRadius;

  /// 密碼
  final bool isObscureText;

  /// 只讀
  final bool readOnly;

  /// 最大行數
  final int? maxLines;

  /// 最小行數
  final int? minLines;

  /// 字體
  final double? fontSize;

  /// 圖標
  final Widget? icon;
  final Widget? suffixIcon;

  /// 輸入框確認操作方式
  final TextInputAction? textInputAction;

  /// 輸入驗證
  final List<TextInputFormatter>? inputFormatters;

  /// 填充顏色
  final Color? fillColor;

  /// 邊框顏色
  final Color? borderColor;

  /// 内容 padding
  final EdgeInsetsGeometry? contentPadding;

  const InputWidget({
    Key? key,
    this.type = InputWidgetType.none,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.fillColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.onChanged,
  }) : super(key: key);

  /// 文本輸入
  const InputWidget.text({
    Key? key,
    this.type = InputWidgetType.text,
    this.controller,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.fillColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.onChanged,
  }) : super(key: key);

  /// 文本輸入 - 邊框
  const InputWidget.textBorder({
    Key? key,
    this.type = InputWidgetType.textBorder,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.fillColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  /// 文本輸入 - 填充
  InputWidget.textFilled({
    Key? key,
    this.type = InputWidgetType.textFilled,
    Color? fillColor, // 輸入顏色
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.onChanged,
    this.controller,
  })  : fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  /// 文本輸入 - 圖標文本填充
  InputWidget.iconTextFilled(
    this.icon, {
    Key? key,
    this.type = InputWidgetType.iconTextFilled,
    Color? fillColor, // 輸入顏色
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.onChanged,
    this.controller,
  })  : fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  /// 文本輸入 - 後綴圖標文本填充
  InputWidget.suffixTextFilled(
    this.suffixIcon, {
    Key? key,
    this.type = InputWidgetType.suffixTextFilled,
    Color? fillColor, // 輸入顏色
    this.icon,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.onChanged,
    this.controller,
  })  : fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  /// 搜尋
  InputWidget.search({
    Key? key,
    this.type = InputWidgetType.search,
    Color? fillColor, // 輸入顏色
    Widget? icon,
    this.suffixIcon,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.contentPadding,
    this.borderColor,
    this.borderRadius = 11,
    this.onChanged,
    this.controller,
  })  : icon = icon ??
            IconWidget.icon(
              Icons.search,
              color: AppColors.outline,
            ),
        fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  // 邊框
  InputBorder? get _border {
    switch (type) {
      case InputWidgetType.none:
      case InputWidgetType.text:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderSide:
              BorderSide(color: borderColor ?? AppColors.surfaceVariant),
          borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? AppRadius.input)),
        );
    }
  }

  // 尾部圖標
  Widget? get _suffixIcon {
    switch (type) {
      case InputWidgetType.search:
        return <Widget>[
          Container(
            width: 1,
            height: 16,
            color: AppColors.surfaceVariant,
          ).paddingRight(AppSpace.iconTextSmail),
          suffixIcon ??
              IconWidget.icon(
                Icons.photo_camera_outlined,
                color: AppColors.outline,
              )
        ].toRow().width(30).paddingRight(5);
      default:
        return suffixIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    var inputBorder = _border;
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      autocorrect: false,
      obscureText: isObscureText,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      textInputAction: textInputAction,
      style: AppTextStyles.bodyText1?.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.secondary,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: fillColor ?? Colors.transparent,
        prefixIcon: icon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 0,
        ),
        suffixIcon: _suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 0,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.bodyText2?.copyWith(
          fontWeight: FontWeight.w300,
          color: AppColors.secondary.withOpacity(0.5),
        ),
        contentPadding: contentPadding ?? AppSpace.edgeInput,
        isCollapsed: true,
        isDense: true,
        filled: true,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        errorBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        disabledBorder: inputBorder,
      ),
    );
  }
}
