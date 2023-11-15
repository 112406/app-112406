import 'package:healthcare_app/common/index.dart';

class UserHealthModel {
  HeartRate? heartRate;
  Step? steps;
  SleepHour? sleep;
  BloodPressure? bloodPressure;

  UserHealthModel({
    this.heartRate,
    this.steps,
    this.sleep,
    this.bloodPressure,
  });

  Map<String, dynamic> toJson() => {
        'heartRate': heartRate?.toJson(),
        'steps': steps?.toJson(),
        'sleep': sleep?.toJson(),
        'bloodPressure': bloodPressure?.toJson(),
      };

  factory UserHealthModel.fromJson(Map<String, dynamic> json) {
    return UserHealthModel(
      heartRate: json['heartRate'] == null
          ? null
          : HeartRate.fromJson(json['heartRate'] as Map<String, dynamic>),
      steps: json['steps'] == null ? null : Step.fromJson(json['steps']),
      sleep: json['sleep'] == null ? null : SleepHour.fromJson(json['sleep']),
      bloodPressure: json['bloodPressure'] == null
          ? null
          : BloodPressure.fromJson(
              json['bloodPressure'] as Map<String, dynamic>),
    );
  }
}
