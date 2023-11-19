import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:healthcare_app/common/index.dart';

class HealthRepository {
  final health = HealthFactory();

  final userRepo = Get.put(UserService());

  Future<List<HeartRate>> getHeartRate() async {
    bool requested =
        await health.requestAuthorization([HealthDataType.HEART_RATE]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.HEART_RATE]);
      // print(healthData);

      return healthData.map((e) {
        var b = e;
        // print(b.value.toJson()['numericValue']);
        // print(b.toJson());
        // userRepo.saveHeartRateData(b.toJson()['numericValue']);

        HeartRate(double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(), b.dateFrom, b.dateTo);
        return HeartRate(double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(), b.dateFrom, b.dateTo);
      }).toList();
    }
    return [];
  }

  Future<List<BloodPressureDiastolic>> getBloodPressureDiastolic() async {
    bool requested = await health
        .requestAuthorization([HealthDataType.BLOOD_PRESSURE_DIASTOLIC]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.BLOOD_PRESSURE_DIASTOLIC]);

      return healthData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return BloodPressureDiastolic(
            double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(),
            b.dateFrom,
            b.dateTo);
      }).toList();
    }
    return [];
  }

  Future<List<BloodPressureSystolic>> getBloodPressureSystolic() async {
    bool requested = await health
        .requestAuthorization([HealthDataType.BLOOD_PRESSURE_SYSTOLIC]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.BLOOD_PRESSURE_SYSTOLIC]);

      return healthData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return BloodPressureSystolic(
            double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(),
            b.dateFrom,
            b.dateTo);
      }).toList();
    }
    return [];
  }

  Future<List<SleepHour>> getSleep() async {
    bool requested =
        await health.requestAuthorization([HealthDataType.SLEEP_ASLEEP]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.SLEEP_ASLEEP]);
      return healthData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return SleepHour(double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(), b.dateFrom, b.dateTo);
      }).toList();
    }
    return [];
  }

  Future<List<Steps>> getStep() async {
    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 1)),
          DateTime.now(),
          [HealthDataType.STEPS]);

      return healthData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return Steps(double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(), b.dateFrom, b.dateTo);
      }).toList();
    }
    return [];
  }

  Future<List<Calories>> getBurnedEnergy() async {
    bool requested = await health
        .requestAuthorization([HealthDataType.ACTIVE_ENERGY_BURNED]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 1)),
          DateTime.now(),
          [HealthDataType.ACTIVE_ENERGY_BURNED]);

      return healthData.map((e) {
        var b = e;
        print(b.value.toJson());
        print(b.value.toJson()['numericValue']);
        return Calories(double.parse(b.value.toJson()['numericValue']),
            b.unit.toString(), b.dateFrom, b.dateTo);
      }).toList();
    }
    return [];
  }

  // Future<List<Step>> getSleep() async {
  //   bool requested = await health
  //       .requestAuthorization([HealthDataType.SLEEP_ASLEEP]);
  //   if (requested) {
  //     List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
  //         DateTime.now().subtract(const Duration(days: 7)),
  //         DateTime.now(),
  //         [HealthDataType.SLEEP_ASLEEP]);

  //     return healthData.map((e) {
  //       var b = e;
  //       print(b.value.toJson()['numericValue']);
  //       return HeartRate(double.parse(b.value.toJson()['numericValue']),
  //           b.unit.toString(), b.dateFrom, b.dateTo);
  //     }).toList();
  //   }
  //   return [];
  // }

  // Future<List<>>
}
//   final health = HealthFactory();

//   Future<List<BloodGlucose>> getBloodGlucose() async {
//     bool requested =
//         await health.requestAuthorization([HealthDataType.BLOOD_GLUCOSE]);

//     if (requested) {
//       List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
//           DateTime.now().subtract(const Duration(days: 7)),
//           DateTime.now(),
//           [HealthDataType.BLOOD_GLUCOSE]);

//       return healthData.map((e) {
//         var b = e;
//         print(b.value.toJson()['numericValue']);
//         return BloodGlucose(
//           double.parse(b.value.toJson()['numericValue']),
//           b.unitString,
//           b.dateFrom,
//           b.dateTo,
//         );
//       }).toList();
//     }
//     return [];
//   }
// }

// /*
// / create a HealthFactory for use in the app
//     final health = HealthFactory(useHealthConnectIfAvailable: false);

//     // define the types to get
//     var types = [
//       HealthDataType.WEIGHT,
//       HealthDataType.STEPS,
//       HealthDataType.HEIGHT,
//       HealthDataType.BLOOD_GLUCOSE,
//       HealthDataType.WORKOUT,
//       HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
//       HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
//     ];

//     // requesting access to the data types before reading them
//     bool requested = await health.requestAuthorization(types);

//     var now = DateTime.now();

//     // fetch health data from the last 24 hours
//     List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
//         now.subtract(const Duration(days: 1)), now, types);

//     // request permissions to write steps and blood glucose
//     var permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

//     await health.requestAuthorization(types, permissions: permissions);

//     // write steps and blood glucose
//     bool success =
//         await health.writeHealthData(10, HealthDataType.BLOOD_OXYGEN, now, now);
//     success = await health.writeHealthData(
//         3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

//     // get the number of steps for today
//     var midnight = DateTime(now.year, now.month, now.day);
//     int? steps = await health.getTotalStepsInInterval(midnight, now);
//     print(healthData);
// */
