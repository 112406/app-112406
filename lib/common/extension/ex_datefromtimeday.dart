import 'package:flutter/material.dart';

extension DateTimeFromTimeOfDay on DateTime {
  DateTime appliedFromTimeOfDay(TimeOfDay timeOfDay) {
    return DateTime.utc(year, month, day, timeOfDay.hour, timeOfDay.minute);
  }
}
