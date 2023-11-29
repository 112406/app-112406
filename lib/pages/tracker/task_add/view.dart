import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/pages/index.dart';
import 'package:intl/intl.dart';

import '../tracker_index/widgets/button.dart';
import '../tracker_index/widgets/theme.dart';
import 'index.dart';
import 'widgets/input_field.dart';

class TaskAddPage extends GetView<TrackerIndexController> {
  const TaskAddPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("TaskAddPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    // //Below shows the time like Sep 15, 2021
    // //print(new DateFormat.yMMMd().format(new DateTime.now()));
    // print(" starttime " + controller.startTime!);
    // final now = new DateTime.now();
    // final dt = DateTime(now.year, now.month, now.day, now.minute, now.second);
    // final format = DateFormat.jm();
    // print(format.format(dt));
    // print("add Task date: " + DateFormat.yMd().format(controller.selectedDate));
    // //_startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
    return GetBuilder<TrackerIndexController>(
      init: TrackerIndexController(),
      id: "task_add",
      builder: (_) {
        return Scaffold(
          appBar: _appBar(context),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.addTask.tr,
                    style: headingTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                    title: LocaleKeys.addTaskTitle.tr,
                    hint: LocaleKeys.addTaskTitleHint.tr,
                    controller: controller.titleController,
                  ),
                  InputField(
                      title: LocaleKeys.addTaskNote.tr,
                      hint: LocaleKeys.addTaskNoteHint.tr,
                      controller: controller.noteController),
                  Obx(
                    () => InputField(
                      title: LocaleKeys.addTaskDate.tr,
                      // hint: DateFormat.yMd().format(controller.selectedDate.value),

                      hint: controller.selectedDate?.value,
                      widget: IconButton(
                        icon: (const Icon(
                          Icons.calendar_month_sharp,
                          color: Colors.grey,
                        )),
                        onPressed: () {
                          // _showDatePicker(context);
                          _getDateFromUser(context);
                        },
                      ),
                    ),
                  ),
                  // InputField(
                  //   title: "Date",
                  //   // hint: DateFormat.yMd().format(controller.selectedDate.value),
                  //   hint: controller.selectedDate?.value,
                  //   widget: IconButton(
                  //     icon: (const Icon(
                  //       Icons.calendar_month_sharp,
                  //       color: Colors.grey,
                  //     )),
                  //     onPressed: () {
                  //       // _showDatePicker(context);
                  //       _getDateFromUser(context);
                  //     },
                  //   ),
                  // ),
                  Row(
                    children: [
                      Expanded(
                          child: Obx(
                        () => InputField(
                          title: LocaleKeys.addTaskStartTime.tr,
                          hint: controller.startTime!.value,
                          widget: IconButton(
                            icon: (const Icon(
                              Icons.alarm,
                              color: Colors.grey,
                            )),
                            onPressed: () {
                              _getTimeFromUser(context, true);
                            },
                          ),
                        ),
                      )
                          // InputField(
                          //   title: "Start Time",
                          //   hint: controller.startTime.value,
                          //   widget: IconButton(
                          //     icon: (const Icon(
                          //       Icons.alarm,
                          //       color: Colors.grey,
                          //     )),
                          //     onPressed: () {
                          //       _getTimeFromUser(context, true);
                          //       // setState(() {

                          //       // });
                          //     },
                          //   ),
                          // ),
                          ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: InputField(
                          title: LocaleKeys.addTaskEndTime.tr,
                          hint: controller.endTime?.value,
                          widget: IconButton(
                            icon: (const Icon(
                              Icons.alarm,
                              color: Colors.grey,
                            )),
                            onPressed: () {
                              _getTimeFromUser(context, false);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Obx(
                    () => InputField(
                      title: LocaleKeys.addTaskRemind.tr,
                      hint: "${controller.selectedRemind.value} minutes early",
                      widget: Row(
                        children: [
                          DropdownButton<String>(
                              //value: _selectedRemind.toString(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              style: subTitleTextStle,
                              underline: Container(height: 0),
                              onChanged: (String? newValue) {
                                // controller.selectedRemind = int.parse(newValue!);
                                controller.selectedRemind.value =
                                    int.parse(newValue!);
                                // controller.update();
                                // setState(() {
                                //   _selectedRemind = int.parse(newValue!);
                                // });
                              },
                              items: controller.remindList
                                  .map<DropdownMenuItem<String>>((int value) {
                                return DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(value.toString()),
                                );
                              }).toList()),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => InputField(
                      title: LocaleKeys.addTaskRepeat.tr,
                      hint: controller.selectedRepeat?.value,
                      widget: Row(
                        children: [
                          Container(
                            child: DropdownButton<String>(
                                dropdownColor: Colors.blueGrey,
                                // value: _selectedRemind.toString(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                ),
                                iconSize: 32,
                                elevation: 4,
                                style: subTitleTextStle,
                                underline: Container(
                                  height: 6,
                                ),
                                onChanged: (String? newValue) {
                                  controller.selectedRepeat?.value = newValue!;
                                  // setState(() {
                                  //   _selectedRepeat = newValue;
                                  // });
                                },
                                items: controller.repeatList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList()),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _colorChips(),
                      MyButton(
                        label: LocaleKeys.taskCreate.tr,
                        onTap: () {
                          _validateInputs();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _validateInputs() {
    if (controller.titleController.text.isNotEmpty &&
        controller.noteController.text.isNotEmpty) {
      print(controller.noteController.text);
      print(controller.selectedRemind.value);
      _addTaskToDB();
      Get.back();
    } else if (controller.titleController.text.isEmpty ||
        controller.noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      print("############ SOMETHING BAD HAPPENED #################");
    }
  }

  _addTaskToDB() async {
    int value = await controller.addTask(
      task: Task(
        note: controller.noteController.text,
        title: controller.titleController.text,
        // date: DateFormat.yMd().format(controller.selectedDate),
        date: controller.selectedDate?.value,
        startTime: controller.startTime?.value,
        endTime: controller.endTime?.value,
        remind: controller.selectedRemind.value,
        repeat: controller.selectedRepeat?.value,
        color: controller.selectedColor.value,
        isCompleted: 0,
      ),
    );
    print("my id is {$value}");
  }

  _colorChips() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Color",
        style: titleTextStle,
      ),
      const SizedBox(
        height: 8,
      ),
      // Obx(() => null),
      Wrap(
        children: List<Widget>.generate(
          3,
          (int index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    controller.selectedColor.value = index;
                    // setState(() {
                    //   _selectedColor = index;
                    // });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? primaryClr
                          : index == 1
                              ? pinkClr
                              : yellowClr,
                      child: index == controller.selectedColor.value
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 18,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                ));
          },
        ).toList(),
      ),
    ]);
  }

  _appBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, size: 24, color: AppColors.primary),
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

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  _getTimeFromUser(BuildContext context, bool isStartTime) async {
    TimeOfDay? pickedTime = await _showTimePicker(context);
    if (!context.mounted) return;
    // String? formatedTime = pickedTime.format(context);
    // print(pickedTime);
    String? formatedTime = pickedTime?.to24hours();

    // String? formatedTime = pickedTime?.to24hours();
    print(formatedTime);
    if (pickedTime == null) {
      print("time canceld");
    } else if (isStartTime) {
      controller.startTime?.value = formatedTime!;
    } else if (!isStartTime) {
      controller.endTime?.value = formatedTime!;
      //_compareTime();
    }
  }

  _showTimePicker(BuildContext context) async {
    return showTimePicker(
      initialTime: TimeOfDay(
          hour: int.parse(controller.startTime!.split(":")[0]),
          minute: int.parse(controller.startTime!.split(":")[1].split(" ")[0])),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!),
    );
  }

  _getDateFromUser(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        // controller.selectedDate.value to date
        initialDate:
            DateFormat('dd/MM/yyyy').parse(controller.selectedDate!.value),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      // setState(() {
      controller.selectedDate?.value =
          DateFormat('dd/MM/yyyy').format(pickedDate);
      // });
    }
  }
}
