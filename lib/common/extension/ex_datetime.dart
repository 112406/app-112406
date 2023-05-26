import 'package:intl/intl.dart';

/// 擴展日期時間
extension ExDateTime on DateTime {
  /// 格式化日期 yyyy-MM-dd
  String toDateString({String format = 'yyyy-MM-dd'}) =>
      DateFormat(format).format(this);
}
