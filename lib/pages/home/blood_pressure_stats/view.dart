import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class BloodPressureStatsPage extends GetView<BloodPressureStatsController> {
  const BloodPressureStatsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("BloodPressureStatsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BloodPressureStatsController>(
      init: BloodPressureStatsController(),
      id: "blood_pressure_stats",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("blood_pressure_stats")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
