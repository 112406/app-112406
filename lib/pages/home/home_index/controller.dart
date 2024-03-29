import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeIndexController extends GetxController {
  HomeIndexController();

  final repository = HealthRepository();
  final heartRates = ValueNotifier(<HeartRate>[]);
  final bloodPressureSystolics = ValueNotifier(<BloodPressureSystolic>[]);
  final bloodPressureDiastolics = ValueNotifier(<BloodPressureDiastolic>[]);
  final steps = ValueNotifier(<Steps>[]);
  final sleeps = ValueNotifier(<SleepHour>[]);
  final calories = ValueNotifier(<Calories>[]);
  // final health = HealthFactory(useHealthConnectIfAvailable: true);
  // final health = HealthFactory(useHealthConnectIfAvailable: false);
  // final repository = HealthRepository();

  // 主界面 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  /// 拉取數據
  /// isRefresh 是否是刷新
  // Future<bool> _loadNewsSell(bool isRefresh) async {
  // 拉取數據
  // var result = await ProductApi.products(ProductsReq(
  //   // 刷新, 重置頁數1
  //   page: isRefresh ? 1 : _page,
  //   // 每頁條數
  //   prePage: _limit,
  // ));

  // 下拉刷新
  // if (isRefresh) {
  //   _page = 1; // 重置頁數1
  //   newProductProductList.clear(); // 清空数据
  // }

  // 有數據
  // if (result.isNotEmpty) {
  //   // 頁數+1
  //   _page++;

  //   // 新增數據
  //   newProductProductList.addAll(result);
  // }

  // 是否空
  // return result.isEmpty;
  // }

  // 下拉刷新
  void onRefresh() async {
    try {
      await HealthRepository().requestPermission();
      await getHeartRateData();
      await getBloodPressureSystolicData();
      await getBloodPressureDiastolicData();
      await getStepData();
      await getSleepData();
      await getCaloriesData();
      refreshController.refreshCompleted();
    } catch (error) {
      refreshController.refreshFailed();
    }
    // getHeartRateData();
    // getBloodPressureData();
    // getSleepData();
    update(["home_index"]);
  }

  Future<void> getHeartRateData() async {
    heartRates.value = await repository.getHeartRate();
  }

  Future<void> getBloodPressureSystolicData() async {
    bloodPressureSystolics.value = await repository.getBloodPressureSystolic();
  }

  Future<void> getBloodPressureDiastolicData() async {
    bloodPressureDiastolics.value =
        await repository.getBloodPressureDiastolic();
  }

  Future<void> getStepData() async {
    steps.value = await repository.getStep();
  }

  Future<void> getSleepData() async {
    sleeps.value = await repository.getSleep();
  }

  Future<void> getCaloriesData() async {
    calories.value = await repository.getBurnedEnergy();
  }

  // Future<void> getBloodPressureData() async {
  //   heartRates.value = await repository.getBloodPressure();
  // }

  // Future<void> saveHealthData(HeartRate user) async {
  //   await userRepo.createUser(user);
  // }

  // Future<void> getData() async {
  //   repository.GetBloodPressure();
  // // create a HealthFactory for use in the app, choose if HealthConnect should be used or not

  // // define the types to get
  // var types = [
  //   HealthDataType.STEPS,
  //   HealthDataType.BLOOD_GLUCOSE,
  // ];

  // // requesting access to the data types before reading them
  // bool requested = await health.requestAuthorization(types);

  // var now = DateTime.now();

  // // fetch health data from the last 24 hours
  // List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
  //     now.subtract(const Duration(days: 1)), now, types);

  // // request permissions to write steps and blood glucose
  // types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
  // var permissions = [
  //   HealthDataAccess.READ_WRITE,
  //   HealthDataAccess.READ_WRITE
  // ];
  // await health.requestAuthorization(types, permissions: permissions);

  // // write steps and blood glucose
  // bool success =
  //     await health.writeHealthData(10, HealthDataType.STEPS, now, now);
  // success = await health.writeHealthData(
  //     3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

  // // get the number of steps for today
  // var midnight = DateTime(now.year, now.month, now.day);
  // int? steps = await health.getTotalStepsInInterval(midnight, now);
  // }

  _initData() {
    // items = [
    //   FunctionModel(
    //     image: AssetsImages.heartratecardPng,
    //     title: LocaleKeys.ghomeFuncCardHeartRate.tr,
    //     desc: LocaleKeys.ghomeFuncCardHeartRateDesc.tr,
    //   ),
    //   FunctionModel(
    //     image: AssetsImages.bloodpressurecardPng,
    //     title: LocaleKeys.ghomeFuncCardBloodPressure.tr,
    //     desc: LocaleKeys.ghomeFuncCardBloodPressureDesc.tr,
    //   ),
    //   FunctionModel(
    //     image: AssetsImages.sleepcardPng,
    //     title: LocaleKeys.ghomeFuncCardSleep.tr,
    //     desc: LocaleKeys.ghomeFuncCardSleepDesc.tr,
    //   ),
    // ];

    /// IOS才可直接要資料
    // getHeartRateData();
    // getBloodPressureData();
    // getSleepData();
    update(["home_index"]);
  }

  // 導航點擊事件
  void onAppBarTap() {}

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
    // getData();
  }

  // @override
  // void onClose() {
  //   super.dispose();
  //   heartRates.dispose();
  //   bloodPressures.dispose();
  //   sleeps.dispose();
  //   // 刷新控制器釋放
  //   refreshController.dispose();
  // }
}
