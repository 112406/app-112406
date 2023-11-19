import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'index.dart';

class BloodPressureSystolicPage extends GetView<BloodPressureSystolicController> {
  const BloodPressureSystolicPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("BloodPressureSystolicPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BloodPressureSystolicController>(
      init: BloodPressureSystolicController(),
      id: "blood_pressure_systolic",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextWidget.textxl(
              LocaleKeys.ghomeFuncCardBloodPressureSystolic.tr,
            ),
          ),
           body: Center(
            child: Container(
              //Initialize chart
              child: FutureBuilder(
                  future: controller.getBloodPressureSystolicData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Blood Pressure Systolic Chart'),
                          series: <ChartSeries<BloodPressureSystolic, String>>[
                            LineSeries<BloodPressureSystolic, String>(
                              dataSource: controller.needs,
                              xValueMapper: (BloodPressureSystolic rate, _) =>
                                  rate.dateFrom.toString().dateFormatOfyyyyMMdd,
                              yValueMapper: (BloodPressureSystolic rate, _) =>
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
