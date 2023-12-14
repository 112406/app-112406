import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'index.dart';

class BloodPressureDiastolicPage
    extends GetView<BloodPressureDiastolicController> {
  const BloodPressureDiastolicPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("BloodPressureDiastolicPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BloodPressureDiastolicController>(
      init: BloodPressureDiastolicController(),
      id: "blood_pressure_diastolic",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextWidget.textxl(
              LocaleKeys.ghomeFuncCardBloodPressureDiastolic.tr,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() => controller.getData()),
            child: const Icon(Icons.refresh),
          ),
          body: Center(
            child: Container(
              //Initialize chart
              child: FutureBuilder(
                  future: controller.getBloodPressureDiastolicData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(
                              text: 'Blood Pressure Diastolic Chart'),
                          series: <ChartSeries<BloodPressureDiastolic, String>>[
                            ColumnSeries<BloodPressureDiastolic, String>(
                              dataSource: controller.needs,
                              xValueMapper: (BloodPressureDiastolic rate, _) =>
                                  rate.dateFrom.toString().dateFormatOfMMdd,
                              yValueMapper: (BloodPressureDiastolic rate, _) =>
                                  rate.value,
                            )
                          ]);
                    } else if (snapshot.data == null) {
                      return const Center(child: Text("No Data"));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ).paddingBottom(100),
        );
      },
    );
  }
}
