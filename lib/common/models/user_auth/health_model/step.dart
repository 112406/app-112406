class Step {
  final num value;
  final String unit;
  final DateTime dateFrom;
  final DateTime dateTo;

  Step(this.value, this.unit, this.dateFrom, this.dateTo);

  factory Step.fromJson(Map<String, dynamic> json) => Step(
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
