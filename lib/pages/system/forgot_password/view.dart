import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  // 主視圖
  // Widget _buildView() {
  //   return const Center(
  //     child: Text("ForgotPasswordPage"),
  //   );
  // }

  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 頭部標題
        PageTitleWidget(
          title: LocaleKeys.retrievePassword.tr,
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

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // email address
        TextWidget.textsm(LocaleKeys.emailAddress.tr)
            .paddingBottom(AppSpace.listItem)
            .alignLeft(),
        TextFormWidget(
          isObscure: false,
          autofocus: true,
          controller: controller.emailaddressController,
          // labelText: LocaleKeys.registerFormName.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ).paddingBottom(24),
        ButtonWidget.primarywithicon(
          IconWidget.svg(
            AssetsMonotoneSvgs.emailSvg12,
            size: 24,
            color: AppColors.onPrimary,
          ).paddingLeft(16),
          LocaleKeys.sentEmail.tr,
          onTap: controller.onResetPassword,
          textWeight: FontWeight.bold,
          textSize: 16,
        ).paddingBottom(50),
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      id: "forgot_password",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("forgot_password")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
