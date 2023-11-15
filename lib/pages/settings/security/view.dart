import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SecurityPage extends GetView<SecurityController> {
  const SecurityPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SecurityPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecurityController>(
      init: SecurityController(),
      id: "security",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("security")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
