import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import 'size_input.dart';

part 'size_form.g.dart';

class SizeForm = SizeFormBase with _$SizeForm;

abstract class SizeFormBase with Store {
  final Logger _logger = GetIt.I.get();

  /// Input for width
  final width = SizeInput();

  /// Input for height
  final height = SizeInput();

  /// Input for length
  final length = SizeInput();

  /// Volume in milliliters
  @computed
  double get volume => width.value * height.value * length.value;

  /// Ceiled volume in liters
  @computed
  int get volumeInLiters => (volume / 1000).ceil();

  /// Value of volume over liter cap (5) in liters
  @computed
  int get overLiterCap {
    var over = volumeInLiters - 5;
    return over > 0 ? over : 0;
  }

  /// Whether is size extra large
  /// (if so, it'll be calculated cargo delivery logistics cost)
  ///
  /// It is, if
  /// - at least one size is more than 120cm
  /// - sum of sizes is over 200cm
  @computed
  bool get isExtraLargeProduct {
    _logger.i('Extra-large product check');
    var maxMoreThan120 =
        length.value > 120 || height.value > 120 || width.value > 120;
    var sumSizeMoreThan200 = length.value + height.value + width.value > 200;
    return maxMoreThan120 || sumSizeMoreThan200;
  }

  /// CLears all size form's inputs
  void clear() {
    width.clear();
    height.clear();
    length.clear();
  }
}
