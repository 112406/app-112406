import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/pages/tracker/tracker_index/widgets/button.dart';
import 'package:healthcare_app/pages/tracker/tracker_index/widgets/theme.dart';
import 'package:intl/intl.dart';

import 'index.dart';
import 'widgets/size_config.dart';
import 'widgets/task_tile.dart';

class TrackerIndexPage extends GetView<TrackerIndexController> {
  const TrackerIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("TrackerIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<TrackerIndexController>(
      init: TrackerIndexController(),
      id: "tracker_index",
      builder: (_) {
        return Scaffold(
          appBar: _appBar(context),
          body: Column(
            children: [
              _addTaskBar(),
              _dateBar(),
              const SizedBox(
                height: 12,
              ),
              _showTasks(),
            ],
          ),
        );
      },
    );
  }

  _dateBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: DatePicker(
          DateTime.now(),
          height: 100.0,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primary,
          //selectedTextColor: primaryClr,
          selectedTextColor: Colors.white,
          dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
            ),
          ),

          onDateChange: (date) {
            // New date selected
            controller.taskselectedDate.value = date;
            print(DateFormat('dd/MM/yyyy')
                .format(controller.taskselectedDate.value));
            controller.update(["tracker_index"]);
            //  DateFormat('dd/MM/yyyy')
            //             .format(controller.taskselectedDate.value);
            // setState(
            //   () {
            //     _selectedDate = date;
            //   },
            // );
          },
        ),
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                LocaleKeys.taskToday.tr,
                style: headingTextStyle,
              ),
            ],
          ),
          MyButton(
            label: "+ ${LocaleKeys.addTask.tr}",
            onTap: () async {
              await Get.toNamed(RouteNames.trackerTaskAdd);
              // await Get.to(AddTaskPage());
              controller.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        // print(controller.taskList.length);
        if (controller.taskList.isEmpty) {
          return _noTaskMsg();
        } else {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.taskList.length,
              itemBuilder: (context, index) {
                // Task task = controller.taskList[index];
                // print(task.toJson());
                // if (task.repeat == 'Daily') {
                //   var hour = task.startTime.toString().split(":")[0];
                //   var minutes = task.startTime.toString().split(":")[1];
                //   debugPrint("My time is $hour");
                //   debugPrint("My minute is $minutes");
                //   DateTime date = DateFormat.jm().parse(task.startTime!);
                //   var myTime = DateFormat("HH:mm").format(date);
                //   print("my date "+date.toString());
                //   print("my time " +myTime);
                //   return AnimationConfiguration.staggeredList(
                //       position: index,
                //       child: SlideAnimation(
                //           child: FadeInAnimation(
                //               child: Row(
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               showBottomSheet(context, task);
                //             },
                //             child: TaskTile(task),
                //           )
                //         ],
                //       ))));
                // }
                // if (task.date ==
                //     DateFormat('dd/MM/yyyy')
                //         .format(controller.taskselectedDate.value)) {
                //   print("aaa");
                //   return AnimationConfiguration.staggeredList(
                //       position: index,
                //       child: SlideAnimation(
                //           child: FadeInAnimation(
                //               child: Row(
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               showBottomSheet(context, task);
                //             },
                //             child: TaskTile(task),
                //           )
                //         ],
                //       ))));
                // } else {
                //   return Container();
                // }

                print(controller.taskList.length);
                Task task = controller.taskList[index];
                if (task.repeat == 'Daily') {
                  var hour = task.startTime.toString().split(":")[0];
                  var minutes = task.startTime.toString().split(":")[1];
                  debugPrint("My time is $hour");
                  debugPrint("My minute is $minutes");
                  // DateTime date = DateFormat.jm().parse(task.startTime!);
                  // var myTime = DateFormat("HH:mm").format(date);
                  var myTime = task.startTime;

                  /*
                  print("my date "+date.toString());
                  print("my time " +myTime);
                  var t=DateFormat("M/d/yyyy hh:mm a").parse(task.date+" "+task.startTime);
                  print(t);
                  print(int.parse(myTime.toString().split(":")[0]));*/
                  // print(myTime.toString().split(":")[0]);
                  // print(myTime.toString().split(":")[1]);
                  controller.notifyHelper.scheduledNotification(
                      int.parse(myTime.toString().split(":")[0]),
                      int.parse(myTime.toString().split(":")[1]),
                      // myTime,
                      task);
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1375),
                    child: SlideAnimation(
                      horizontalOffset: 300.0,
                      child: FadeInAnimation(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showBottomSheet(context, task);
                                },
                                child: TaskTile(task)),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (task.date ==
                    DateFormat('dd/MM/yyyy')
                        .format(controller.taskselectedDate.value)) {
                  //notifyHelper.scheduledNotification();
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1375),
                    child: SlideAnimation(
                      horizontalOffset: 300.0,
                      child: FadeInAnimation(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showBottomSheet(context, task);
                                },
                                child: TaskTile(task)),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              });
        }
      }),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            // ThemeService().switchTheme();
            // notifyHelper.displayNotification(
            //   title: "Theme Changed",
            //   body: Get.isDarkMode
            //       ? "Light theme activated."
            //       : "Dark theme activated",
            // );

            //notifyHelper.scheduledNotification();
            //notifyHelper.periodicalyNotification();
          },
          child: Icon(Get.isDarkMode ? Icons.wb_sunny : Icons.shield_moon,
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        actions: const [
          CircleAvatar(
            radius: 16,
            // backgroundImage: AssetImage("images/girl.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
        ]);
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? SizeConfig.screenHeight * 0.23
            : SizeConfig.screenHeight * 0.35,
        width: SizeConfig.screenWidth,
        color: Get.isDarkMode ? darkHeaderClr : Colors.white,
        child: Column(children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
          ),
          const Spacer(),
          task.isCompleted == 1
              ? Container()
              : _buildBottomSheetButton(
                  label: "Task Completed",
                  onTap: () {
                    controller.markTaskCompleted(task.id);
                    Get.back();
                  },
                  clr: primaryClr),
          _buildBottomSheetButton(
              label: "Delete Task",
              onTap: () {
                controller.deleteTask(task);
                Get.back();
              },
              clr: Colors.red[300]),
          const SizedBox(
            height: 20,
          ),
          _buildBottomSheetButton(
              label: "Close",
              onTap: () {
                Get.back();
              },
              isClose: true),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  _buildBottomSheetButton(
      {required String label,
      Function? onTap,
      Color? clr,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: SizeConfig.screenWidth! * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr!,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
            child: Text(
          label,
          style: isClose
              ? titleTextStle
              : titleTextStle.copyWith(color: Colors.white),
        )),
      ),
    );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          left: controller.left,
          top: controller.top,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   "images/task.svg",
              //   color: primaryClr.withOpacity(0.5),
              //   height: 90,
              //   semanticsLabel: 'Task',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "You do not have any tasks yet!\nAdd new tasks to make your days productive.",
                  textAlign: TextAlign.center,
                  style: subTitleTextStle,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          )),
        )
      ],
    );
  }
}
