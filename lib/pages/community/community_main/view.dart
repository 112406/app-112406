import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CommunityMainPage extends GetView<CommunityMainController> {
  const CommunityMainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CommunityMainPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityMainController>(
      init: CommunityMainController(),
      id: "community_main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("community_main")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
