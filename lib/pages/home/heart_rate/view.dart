import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class HeartRatePage extends GetView<HeartRateController> {
  const HeartRatePage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("HeartRatePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HeartRateController>(
        init: HeartRateController(),
        id: "heart_rate",
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: TextWidget.textxl(
              LocaleKeys.ghomeFuncCardHeartRate.tr,
            ),),
            floatingActionButton: FloatingActionButton(
              onPressed: (() => controller.getData()),
              child: const Icon(Icons.refresh),
            ),
            // body: ValueListenableBuilder(
            //   valueListenable: controller.heartRates,
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
                    future: controller.getHeartRateData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            title: ChartTitle(text: 'Heart Rate Chart'),
                            series: <ChartSeries<HeartRate, String>>[
                              LineSeries<HeartRate, String>(
                                dataSource: controller.needs,
                                xValueMapper: (HeartRate rate, _) => rate
                                    .dateFrom
                                    .toString()
                                    .dateFormatOfyyyyMMdd,
                                yValueMapper: (HeartRate rate, _) => rate.value,
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
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
