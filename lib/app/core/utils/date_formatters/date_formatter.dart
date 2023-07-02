import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateString(DateTime string) {
    String data = string.toString();
    final dateTime = DateTime.parse(data);
    final date = DateFormat('dd/MM/yyyy').format(dateTime);
    return date;
  }
}
