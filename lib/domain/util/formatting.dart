import 'package:carewool_profitability_calculator/domain/util/strings.dart';
import 'package:intl/intl.dart';

abstract final class Formatting {
  Formatting._();

  static final _costFormat = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;

  static String formatTwoFractionDigits(num value) => _costFormat.format(value);

  static String formatCostRu(num value) {
    return '${formatTwoFractionDigits(value)}$rubleCurrency';
  }

  static String formatPercentage(num value) {
    return '${formatTwoFractionDigits(value)}%';
  }
}
