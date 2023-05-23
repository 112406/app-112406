import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_fitness/common/index.dart';

/// TextFormField 表單 輸入框
class TextFormWidget extends StatefulWidget {
  /// 控制器
  final TextEditingController? controller;

  /// 輸入框樣式
  final InputDecoration? decoration;

  /// 驗證函數
  final String? Function(String?)? validator;

  /// 自動焦點
  final bool? autofocus;

  /// 標題
  final String? labelText;

  /// 必須輸入
  final bool? isMustBeEnter;

  /// 是否密碼
  final bool? isObscure;

  /// 是否只讀
  final bool? readOnly;

  /// 輸入法類型
  final TextInputType? keyboardType;

  /// 輸入格式定義
  final List<TextInputFormatter>? inputFormatters;

  /// 提示文字
  final String? hintText;

  /// 點擊事件
  final Function()? onTap;

  const TextFormWidget({
    Key? key,
    this.controller,
    this.autofocus = false,
    this.labelText,
    this.isMustBeEnter = false,
    this.validator,
    this.isObscure = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.hintText,
  }) : super(key: key);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  // 是否顯示明文按鈕
  bool _isShowObscureIcon = false;

  @override
  void initState() {
    super.initState();
    _isShowObscureIcon = widget.isObscure!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap, // 點擊事件
      readOnly: widget.readOnly!, // 是否只讀
      autofocus: widget.autofocus!, // 自動焦點
      keyboardType: widget.keyboardType, // 輸入法類型
      controller: widget.controller, // 控制器
      decoration: widget.isObscure == true
          ? InputDecoration(
              hintText: widget.hintText, // 提示文字
              // 標題
              labelText: widget.isMustBeEnter == true
                  ? "* ${widget.labelText}"
                  : widget.labelText,
              // 密碼按鈕
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isShowObscureIcon = !_isShowObscureIcon;
                  });
                },
                icon: Icon(
                  _isShowObscureIcon == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 15,
                  color: AppColors.surfaceVariant,
                ),
              ),
            )
          : InputDecoration(
              hintText: widget.hintText,
              labelText: widget.isMustBeEnter == true
                  ? "* ${widget.labelText}"
                  : widget.labelText,
            ),
      // 校驗
      validator: widget.validator,
      // 是否密碼
      obscureText: _isShowObscureIcon,
      // 輸入格式
      inputFormatters: widget.inputFormatters,
    );
  }
}
