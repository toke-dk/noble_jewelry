import 'package:intl/intl.dart';

extension DoubleConverter on double {
  String get convertDoublePriceToString => "\$${NumberFormat("#,###.0#", "en_us").format(this)}";
}
