import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        // return Scaffold(
        //   appBar: AppBar(title: const Text("step_tracker")),
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: (() => controller.getData()),
        //     child: const Icon(Icons.refresh),
        //   ),
        //   body: ValueListenableBuilder(
        //     valueListenable: controller.steps,
        //     builder: (context, value, child) {
        //       return GridView(
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2),
        //         children: List.generate(value.length, (index) {
        //           return Card(
        //             child: Column(
        //               children: [
        //                 Text(value[index].value.toString()),
        //                 Text(value[index].unit),
        //                 Text(value[index].dateFrom.toString()),
        //                 Text(value[index].dateTo.toString()),
        //               ],
        //             ),
        //           );
        //         }),
        //       );
        //     },
        //   ),
        //   // body: SafeArea(
        //   //   child: _buildView(),
        //   // ),
        // );
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextWidget.textxl(
              LocaleKeys.ghomeFitnessStepsTaken.tr,
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
                  future: controller.getStepsData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Steps Chart'),
                          series: <ChartSeries<Steps, String>>[
                            LineSeries<Steps, String>(
                              dataSource: controller.needs,
                              xValueMapper: (Steps rate, _) =>
                                  rate.dateFrom.toString().dateFormatOfyyyyMMdd,
                              yValueMapper: (Steps rate, _) =>
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
