class Calories {
  final num value;
  final String unit;
  final DateTime dateFrom;
  final DateTime dateTo;

  Calories(this.value, this.unit, this.dateFrom, this.dateTo);

  factory Calories.fromJson(Map<String, dynamic> json) => Calories(
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
