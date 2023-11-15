class HeartRate {
  final num value;
  final String unit;
  final DateTime dateFrom;
  final DateTime dateTo;

  HeartRate(this.value, this.unit, this.dateFrom, this.dateTo);

  factory HeartRate.fromJson(Map<String, dynamic> json) => HeartRate(
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

  // HeartRate.fromSnapshot(DataSnapshot snapshot) {
  //   Map<String, dynamic> myData =
  //       Map<String, dynamic>.from(snapshot.value as Map);
  //   value = myData['value'];
  //   unit = myData['unit'];
  //   dateFrom = myData['dateFrom'];
  //   dateTo = myData['dateTo'];
  // }

  // toNumString(String value) {
  //   value = value.replaceAll(RegExp(r'[^0-9]'), '');
  //   value.substring(0, value.length - 3);
  //   return value.toString();
  // }
}
