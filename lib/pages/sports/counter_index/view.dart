import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CounterIndexPage extends GetView<CounterIndexController> {
  const CounterIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CounterIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterIndexController>(
      init: CounterIndexController(),
      id: "counter_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("counter_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
