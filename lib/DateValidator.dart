import 'package:intl/intl.dart';
class DateValidator {
  bool isValidDateFormat(String dateString) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    try {
      dateFormat.parse(dateString);
      return true;
    } catch (e) {
      return false;
    }
  }
}