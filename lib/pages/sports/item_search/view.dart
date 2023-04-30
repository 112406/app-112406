import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ItemSearchPage extends GetView<ItemSearchController> {
  const ItemSearchPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ItemSearchPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemSearchController>(
      init: ItemSearchController(),
      id: "item_search",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("item_search")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
