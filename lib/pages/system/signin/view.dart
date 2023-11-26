import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({Key? key}) : super(key: key);

  // 內容頁
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 頭部標題
        PageTitleWidget(
          title: LocaleKeys.loginTitle.tr,
          desc: LocaleKeys.loginDesc.tr,
        ),
        // SizedBox(height: 32.w),

        // 表單
        _buildForm(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  // 表單頁
  Widget _buildForm() {
    return Form(
      key: controller.formKey, //設置global key，用於後面獲取form state
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // email address
        TextWidget.textsm(LocaleKeys.emailAddress.tr)
            .paddingBottom(AppSpace.listItem)
            .alignLeft(),
        TextFormWidget(
          autofocus: true,
          controller: controller.emailaddressController,
          // labelText: LocaleKeys.registerFormName.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ).paddingBottom(24),

        // password
        TextWidget.textsm(LocaleKeys.password.tr)
            .paddingBottom(AppSpace.listItem)
            .alignLeft(),
        TextFormWidget(
          controller: controller.passwordController,
          // labelText: LocaleKeys.registerFormPassword.tr,
          isObscure: true,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validators.password(
              6,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "6", "max": "18"},
              ),
            ),
          ]),
        ).paddingBottom(32),

        // Forgot Password?
        // TextWidget.body1(LocaleKeys.loginForgotPassword.tr)
        //     .alignRight()
        //     .paddingBottom(50.w),

        // 登錄按鈕
        ButtonWidget.primarywithicon(
          IconWidget.svg(
            AssetsMonotoneSvgs.userSv22g,
            size: 24,
            color: AppColors.onPrimary,
          ).paddingLeft(16),
          LocaleKeys.loginSignIn.tr,
          onTap: controller.onSignIn,
          textWeight: FontWeight.bold,
          textSize: 16,
        ).paddingBottom(50),

        // OR
        // TextWidget.body1(LocaleKeys.loginOrText.tr).paddingBottom(30.w),

        // 其它登錄按鈕
        // <Widget>[
        //   ButtonWidget.iconTextOutlined(
        //     IconWidget.svg(AssetsSvgs.facebookSvg),
        //     "Facebook",
        //     borderColor: AppColors.surfaceVariant,
        //     width: 149.w,
        //     height: 44.w,
        //   ),
        //   ButtonWidget.iconTextOutlined(
        //     IconWidget.svg(AssetsSvgs.googleSvg),
        //     "Google",
        //     borderColor: AppColors.surfaceVariant,
        //     width: 149.w,
        //     height: 44.w,
        //   ),
        // ].toRow(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ),
        // 提示文字
        _buildTips(),

        // end
      ].toColumn(),
    );
  }

  // 提示
  Widget _buildTips() {
    return Column(
      children: [
        <Widget>[
          // 提示
          TextWidget.textsm(LocaleKeys.alreadyHaveaccount.tr),
          // 註冊文字按鈕
          ButtonWidget.text(
            LocaleKeys.loginSignUp.tr,
            onTap: controller.onSignUp,
            textSize: 12,
            textColor: AppColors.primary,
          )
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        TextWidget.textmd(LocaleKeys.loginOrText.tr),
        <Widget>[
          // 提示
          TextWidget.textsm(LocaleKeys.forgotPassword.tr),
          // 註冊文字按鈕
          ButtonWidget.text(
            LocaleKeys.retrievePassword.tr,
            onTap: controller.onForgotPassword,
            textSize: 12,
            textColor: AppColors.primary,
          )
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      init: SigninController(),
      id: "signin",
      builder: (_) {
        return Scaffold(
          appBar: null,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
