import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 頭部標題
        PageTitleWidget(
          title: LocaleKeys.registerTitle.tr,
          desc: '',
        ),

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
      key: controller.formKey, // 設置global key，用於後面獲取form state
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // username
        TextWidget.textsm(LocaleKeys.userName.tr)
            .paddingBottom(AppSpace.listItem)
            .alignLeft(),
        TextFormWidget(
          autofocus: true,
          controller: controller.userNameController,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
          ]),
        ).paddingBottom(16),

        // email address
        TextWidget.textsm(LocaleKeys.emailAddress.tr)
            .paddingBottom(AppSpace.listItem)
            .alignLeft(),
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ).paddingBottom(16),

        // first name
        // TextFormWidget(
        //   autofocus: true,
        //   controller: controller.firstNameController,
        //   labelText: LocaleKeys.registerFormFirstName.tr,
        // ),

        // // last name
        // TextFormWidget(
        //   autofocus: true,
        //   controller: controller.lastNameController,
        //   labelText: LocaleKeys.registerFormLastName.tr,
        // ),

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
        ).paddingBottom(16),

        //confirm password
        TextWidget.textsm(LocaleKeys.passwordconfirm.tr)
            .paddingBottom(AppSpace.listItem)
            .alignLeft(),
        TextFormWidget(
          controller: controller.confirmPasswordController,
          // labelText: LocaleKeys.passwordconfirm.tr,
          isObscure: true,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.compare(controller.passwordController,
                LocaleKeys.validatorPasswordConfirm.tr)
          ]),
        ).paddingBottom(50),

        // 註冊按鈕
        _buildBtnSignUp(),

        // 提示文字
        _buildTips(),

        //
      ].toColumn(),
    );
  }

  // 按鈕
  Widget _buildBtnSignUp() {
    return ButtonWidget.primarywithicon(
      IconWidget.svg(
        AssetsMonotoneSvgs.userSv22g,
        size: 24,
        color: AppColors.onPrimary,
      ).paddingLeft(16),
      LocaleKeys.loginSignUp.tr,
      onTap: controller.onSignUp,
      textWeight: FontWeight.bold,
      textSize: 16,
    ).paddingBottom(AppSpace.listRow);
  }

  // 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      TextWidget.textsm(LocaleKeys.registerHaveAccount.tr),
      // 登入文字按鈕
      ButtonWidget.text(
        LocaleKeys.loginSignIn.tr,
        onTap: controller.onSignIn,
        textSize: 12,
        textColor: AppColors.primary,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      id: "signup",
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
