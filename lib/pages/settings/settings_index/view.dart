import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class SettingsIndexPage extends GetView<SettingsIndexController> {
  const SettingsIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Center(
          child: Text(
        "Welcome Home buddy!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
      )),
      const SizedBox(
        height: 30,
      ),
      GestureDetector(
        onTap: () {
          controller.onLogout();
        },
        child: Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "sign out",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed(RouteNames.settingsMyAccount);
        },
        child: Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "account",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsIndexController>(
      init: SettingsIndexController(),
      id: "settings_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("settings_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
