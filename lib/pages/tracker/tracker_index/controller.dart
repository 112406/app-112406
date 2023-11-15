import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/models/index.dart';
import 'package:healthcare_app/common/services/index.dart';
import 'package:intl/intl.dart';

class TrackerIndexController extends GetxController {
  TrackerIndexController();

  // final ValueNotifier<DateTime> taskselectedDate =
  //     ValueNotifier(DateTime.parse(DateTime.now().toString()));

  // final Rxn<DateTime> taskselectedDate = Rxn<DateTime>();
  final Rx<DateTime> taskselectedDate = DateTime.now().obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  // DateTime selectedDate = DateTime.now();
  RxString? selectedDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now()).toString().obs;
  //String _startTime = DateFormat("hh:mm").format(DateTime.now());
  //_startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  RxString? startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString().obs;

  RxString? endTime = "9:30 AM".obs;
  RxInt selectedColor = 0.obs;

  RxInt selectedRemind = 5.obs;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  final RxList<Task> taskList = List<Task>.empty().obs;

  RxString? selectedRepeat = 'None'.obs;
  List<String> repeatList = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  late var notifyHelper;
  bool animate = false;
  double left = 630;
  double top = 900;
  Timer? _timer;

  _initData() {
    _timer = Timer(const Duration(milliseconds: 500), () {
      animate = true;
      left = 30;
      top = top / 3;
    });
    update(["tracker_index"]);
  }

  void onTap() {}

  @override
  void onReady() {
    getTasks();
    super.onReady();
    // notifyHelper = NotifyHelper();
    // notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermissions();
    // _timer = Timer(Duration(milliseconds: 500), () {
    //   setState(() {
    //     animate=true;
    //     left=30;
    //     top=top/3;
    //   });
    // });
    _initData();
  }

  @override
  void onInit() {
    super.onInit();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermissions();
  }

  // add data to table
  //second brackets means they are named optional parameters
  Future<int> addTask({required Task task}) async {
    // await DBHelper.insert(task);
    return await DBHelper.insert(task);
  }

  // get all the data from table
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  // delete data from table
  void deleteTask(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  // update data int table
  void markTaskCompleted(int? id) async {
    await DBHelper.update(id);
    getTasks();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
