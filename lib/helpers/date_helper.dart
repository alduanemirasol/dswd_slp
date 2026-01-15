import 'package:intl/intl.dart';

class DateHelper {
  static String now() => DateTime.now().toIso8601String();

  static String format(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }
}
