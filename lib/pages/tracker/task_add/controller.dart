import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:intl/intl.dart';

class TaskAddController extends GetxController {
  TaskAddController();

  // final TextEditingController titleController = TextEditingController();
  // final TextEditingController noteController = TextEditingController();

  // // DateTime selectedDate = DateTime.now();
  // RxString? selectedDate =
  //     DateFormat('dd/MM/yyyy').format(DateTime.now()).toString().obs;
  // //String _startTime = DateFormat("hh:mm").format(DateTime.now());
  // //_startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  // RxString? startTime =
  //     DateFormat('hh:mm a').format(DateTime.now()).toString().obs;

  // RxString? endTime = "9:30 AM".obs;
  // RxInt selectedColor = 0.obs;

  // RxInt selectedRemind = 5.obs;
  // List<int> remindList = [
  //   5,
  //   10,
  //   15,
  //   20,
  // ];

  // final RxList<Task> taskList = List<Task>.empty().obs;

  // RxString? selectedRepeat = 'None'.obs;
  // List<String> repeatList = [
  //   'None',
  //   'Daily',
  //   'Weekly',
  //   'Monthly',
  // ];

  _initData() {
    update(["task_add"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // // add data to table
  // //second brackets means they are named optional parameters
  // Future<int> addTask({required Task task}) async {
  //   // await DBHelper.insert(task);
  //   return await DBHelper.insert(task);
  // }

  // // get all the data from table
  // void getTasks() async {
  //   List<Map<String, dynamic>> tasks = await DBHelper.query();
  //   taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  // }

  // // delete data from table
  // void deleteTask(Task task) async {
  //   await DBHelper.delete(task);
  //   getTasks();
  // }

  // // update data int table
  // void markTaskCompleted(int? id) async {
  //   await DBHelper.update(id);
  //   getTasks();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
