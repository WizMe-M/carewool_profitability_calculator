import 'package:carewool_profitability_calculator/app/viewmodel/profitability/logistic_form/size_form/size_input.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'size_form.g.dart';

class SizeForm = SizeFormBase with _$SizeForm;

abstract class SizeFormBase with Store {
  final Logger _logger = GetIt.I.get();

  final width = SizeInput();
  final height = SizeInput();
  final length = SizeInput();

  /// Volume in millitre
  @computed
  double get volume => width.value * height.value * length.value;

  /// Ceiled volume in litre
  @computed
  int get volumeInLiters => (volume / 1000).ceil();

  @computed
  int get overLiterCap => volumeInLiters - 5;

  @computed
  bool get isExtraLargeProduct {
    _logger.i('Extra-large product check');
    var maxMoreThan120 = length.value > 120 ||
        height.value > 120 ||
        width.value > 120;
    var sumSizeMoreThan200 =
        length.value + height.value + width.value > 200;
    return maxMoreThan120 || sumSizeMoreThan200;
  }

  void clear() {
    width.clear();
    height.clear();
    length.clear();
  }
}
