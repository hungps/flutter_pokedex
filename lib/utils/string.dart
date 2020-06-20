import 'package:intl/intl.dart';

String removeTrailingZero(double n) {
  NumberFormat formatter = NumberFormat();
  formatter.minimumFractionDigits = 0;
  formatter.maximumFractionDigits = 2;
  return formatter.format(n);
}
