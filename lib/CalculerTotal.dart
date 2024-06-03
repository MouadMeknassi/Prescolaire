import 'package:flutter_application_1/DateValidator.dart';
class CalculerTotal {
  double calculerTotal(String convention, bool transport, int age, String dateString) {
    DateValidator dateValidator = DateValidator();
    double total = 0.0;
    if (dateValidator.isValidDateFormat(dateString)) {
      switch (age) {
        case 0:
          total=400;
          break;
        case 1:
          total=400;
          break;
        case 2:
          total=400;
          break;
        case 3:
          total=300;
          break;
        case 4:
          total=400;
          break;
        case 5:
          total=500;
          break;  
      }
      switch (convention) {
        case 'OCP':
          total *= 0.40;
          break;
        case 'FM6':
          total *= 0.75;
          break;
        case 'ONE':
          total *= 0.70;
          break;
      }
      if (transport) {
        total += 100.0;
      }
    } else {
      print('Invalid date format');
    }
    return total;
  }

}