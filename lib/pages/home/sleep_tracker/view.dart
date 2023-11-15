import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SleepTrackerPage extends GetView<SleepTrackerController> {
  const SleepTrackerPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("SleepTrackerPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SleepTrackerController>(
      init: SleepTrackerController(),
      id: "sleep_tracker",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("sleep_tracker")),
          floatingActionButton: FloatingActionButton(
            onPressed: (() => controller.getData()),
            child: const Icon(Icons.refresh),
          ),
          body: ValueListenableBuilder(
            valueListenable: controller.sleephours,
            builder: (context, value, child) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: List.generate(value.length, (index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(value[index].value.toString()),
                        Text(value[index].unit),
                        Text(value[index].dateFrom.toString()),
                        Text(value[index].dateTo.toString()),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
          // body: SafeArea(
          //   child: _buildView(),
          // ),
        );
      },
    );
  }
}
