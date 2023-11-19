class BloodPressureDiastolic {
  final num value;
  final String unit;
  final DateTime dateFrom;
  final DateTime dateTo;

  BloodPressureDiastolic(this.value, this.unit, this.dateFrom, this.dateTo);

  factory BloodPressureDiastolic.fromJson(Map<String, dynamic> json) =>
      BloodPressureDiastolic(
        json['value'],
        json['unit'],
        DateTime.parse(json['dateFrom']),
        DateTime.parse(json['dateTo']),
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
        'dateFrom': dateFrom.toIso8601String(),
        'dateTo': dateTo.toIso8601String(),
      };
}
