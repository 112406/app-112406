import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class TextFormPage extends GetView<TextFormController> {
  const TextFormPage({Key? key}) : super(key: key);

  Widget _buildTextForm() {
    return Form(
        key: controller.formKey, //設置global key，用於後面獲取form state
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: <Widget>[
          // email address
          TextFormWidget(
            // autofocus: true,
            keyboardType: TextInputType.emailAddress,
            controller: controller.unameController,
            // labelText: "email",
            // validator: Validatorless.multiple([
            //   Validatorless.required("The field is obligatory"),
            //   Validatorless.min(6,
            //       "Length cannot be less than @size".trParams({"size": "6"})),
            //   Validatorless.max(
            //       18,
            //       "Length cannot be greater than @size"
            //           .trParams({"size": "18"})),
            //   Validatorless.email("The field must be an email"),
            // ]),
          ),
          // password
          TextFormWidget(
            controller: controller.pwdController,
            // labelText: "password",
            isObscure: true,
            // validator: Validatorless.multiple([
            //   Validatorless.required("The field is obligatory"),
            //   Validatorless.min(6,
            //       "Length cannot be less than @size".trParams({"size": "6"})),
            //   Validatorless.max(
            //       18,
            //       "Length cannot be greater than @size"
            //           .trParams({"size": "18"})),
            // ]),
          ).marginOnly(
            bottom: 10,
          ),
          ButtonWidget.primary(
            "submit",
            onTap: () {
              if ((controller.formKey.currentState as FormState).validate()) {
                try {} finally {}
              }
            },
          ).tight(width: 100, height: 40),
        ].toColumn());
  }

  // 主視圖
  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildTextForm().padding(
        all: AppSpace.page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFormController>(
      init: TextFormController(),
      id: "text_form",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("text_form")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
