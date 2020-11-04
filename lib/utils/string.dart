import 'package:intl/intl.dart';

String removeTrailingZero(double n) {
  final formatter = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;

  return formatter.format(n);
}
