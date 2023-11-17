import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'index.dart';

class BloodPressurePage extends GetView<BloodPressureController> {
  const BloodPressurePage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("BloodPressurePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BloodPressureController>(
      init: BloodPressureController(),
      id: "blood_pressure",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextWidget.textxl(
              LocaleKeys.ghomeFuncCardBloodPressure.tr,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() => controller.getData()),
            child: const Icon(Icons.refresh),
          ),
          // body: ValueListenableBuilder(
          //   valueListenable: controller.bloodPressures,
          //   builder: (context, value, child) {
          //     return GridView(
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2),
          //       children: List.generate(value.length, (index) {
          //         return Card(
          //           child: Column(
          //             children: [
          //               Text(value[index].value.toString()),
          //               Text(value[index].unit),
          //               Text(value[index].dateFrom.toString()),
          //               Text(value[index].dateTo.toString()),
          //             ],
          //           ),
          //         );
          //       }),
          //     );
          //   },
          // ),
          body: Center(
            child: Container(
              //Initialize chart
              child: FutureBuilder(
                  future: controller.getBloodPressureData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Blood Pressure Chart'),
                          series: <ChartSeries<BloodPressure, String>>[
                            LineSeries<BloodPressure, String>(
                              dataSource: controller.needs,
                              xValueMapper: (BloodPressure rate, _) =>
                                  rate.dateFrom.toString().dateFormatOfyyyyMMdd,
                              yValueMapper: (BloodPressure rate, _) =>
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
          // body: SafeArea(
          //   child: _buildView(),
          // ),
        );
      },
    );
  }
}
